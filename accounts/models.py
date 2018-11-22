from datetime import timedelta

from django.conf import settings
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db.models import Avg, Sum, F, PositiveIntegerField
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from django.utils import timezone
from sorl.thumbnail import ImageField
from django.db import models
from django_extensions.db import fields as extension_fields


from anime.models import Anime, ScoreAnime, EpisodsAnime


def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'img/user/user_upload/{0}/{1}'.format(instance.id, filename)


# Create your models here.
class RoleUser(models.Model):
    name = models.CharField(max_length=25, blank=True, null=True)
    role_power_number = models.SmallIntegerField(null=True, blank=True)


class Profile(models.Model):
    POLISH = 'pl'
    ENGLISH = 'en'
    LANG_CHOICES = (
        (POLISH, 'Polski'),
        (ENGLISH, 'Angielski')
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    slug = extension_fields.AutoSlugField(populate_from='id')
    role = models.ForeignKey(RoleUser, blank=True, null=True, on_delete=models.CASCADE)
    avatar = ImageField(upload_to=user_directory_path, default='img/user/user.png')
    signature = models.TextField(null=True, blank=True)
    language = models.CharField(max_length=20, choices=LANG_CHOICES, null=True, blank=True, default='pl')
    last_activity = models.DateTimeField(null=True, blank=True, default=timezone.now)

    def __str__(self):
        return self.user.username

    def get_absolute_url(self):
        return reverse("user:profil", kwargs={"pk": self.user.pk, "username": self.user.username})

    def get_absolute_anime_list(self):
        return reverse("user:user_anime_list", kwargs={"pk": self.user.pk, "username": self.user.username})

    @receiver(post_save, sender=User)
    def update_user_profile(sender, instance, created, **kwargs):
        if created:
            Profile.objects.create(user=instance)
        instance.profile.save()

    @staticmethod
    def update_user_activity(user):
        """Updates the timestamp a user has for their last action. Uses UTC time."""
        Profile.objects.update_or_create(user=user, defaults={'last_activity': timezone.now})

    @staticmethod
    def get_user_activities(time_delta=timedelta(minutes=15)):
        """
        Gathers OnlineUserActivity objects from the database representing active users.
        :param time_delta: The amount of time in the past to classify a user as "active". Default is 15 minutes.
        :return: QuerySet of active users within the time_delta
        """
        starting_time = timezone.now() - time_delta
        return Profile.objects.filter(last_activity__gte=starting_time).order_by('-last_activity')

    def online(self):
        if self.last_activity:
            now = timezone.now()
            if now > self.last_activity + timedelta(seconds=settings.USER_ONLINE_TIMEOUT):
                return False
            else:
                return True
        else:
            return False

    def get_score(self):
        general = list(ScoreAnime.objects.filter(user=self.user).aggregate(Avg('general')).values())[0]
        story = list(ScoreAnime.objects.filter(user=self.user).aggregate(Avg('story')).values())[0]
        graphics = list(ScoreAnime.objects.filter(user=self.user).aggregate(Avg('graphics')).values())[0]
        character = list(ScoreAnime.objects.filter(user=self.user).aggregate(Avg('character')).values())[0]
        music = list(ScoreAnime.objects.filter(user=self.user).aggregate(Avg('music')).values())[0]
        top = 0
        try:
            top = ((general + story + graphics + music + character) / 5)
        except:
            pass
        return top

    def get_anime_progress(self):
        watching = ListAnime.objects.filter(user__user=self.user, type='Watching').count()
        planning = ListAnime.objects.filter(user__user=self.user, type='Planning').count()
        completed = ListAnime.objects.filter(user__user=self.user, type='Completed').count()
        dropped = ListAnime.objects.filter(user__user=self.user, type='Dropped').count()
        onhold = ListAnime.objects.filter(user__user=self.user, type='Onhold').count()
        missing = ListAnime.objects.filter(user__user=self.user, type='Missing').count()
        avg = ListAnime.objects.filter(user__user=self.user).count()
        all_progress = 0
        try:
            progress_watching = watching * 100 / avg
            progress_planning = planning * 100 / avg
            progress_completed = completed * 100 / avg
            progress_dropped = dropped * 100 / avg
            progress_onhold = onhold * 100 / avg
            progress_missing = missing * 100 / avg
            all_progress = (watching + planning + completed + dropped + onhold + missing)
        except:
            pass
        context = locals()
        return context

    def watched_episode(self):
        return WatchedAnime.objects.filter(user__user=self.user).count()

    def rewatch_episode(self):
        minus = WatchedAnime.objects.filter(user__user=self.user).count()
        watched = \
            list(WatchedAnime.objects.filter(user__user=self.user, watch__gte=1).aggregate(Sum('watch')).values())[0]
        rewatched = 0
        try:
            rewatched = (watched - minus)
        except:
            pass
        return rewatched

    def time_watched(self):
        watch = list(WatchedAnime.objects.filter(user__user=self.user).aggregate(
            average_difference=Sum(F('watch') * F('episode__dlugosc'), output_field=PositiveIntegerField())).values())[0]
        year = watch // 525600
        month = watch // 43200
        rest_of_month = month % 12
        day = watch // 1440
        rest_of_day = day % 30
        hours = watch // 60
        rest_of_hours = hours % 24
        rest_of_minutes = watch % 60
        minutes = rest_of_minutes
        if year >= 1:
            return "%d lat %2d miesięcy %3d dni %4d godzin %5d minut " % (year,rest_of_month, rest_of_day, rest_of_hours, minutes)
        elif month >= 1:
            return "%d miesięcy %2d dni %3d godzin %4d minut " % (month, rest_of_day, rest_of_hours, minutes)
        elif day >= 1:
            return " %d dni %2d godzin %3d minut " % (day, rest_of_hours, minutes)
        else:

            return "%d godzin %2d minut " % (hours, minutes)




class UserListAnime(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    anime = models.ManyToManyField(Anime, through='ListAnime')
    created_list = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return self.user.username

    def get_absolute_url(self):
        return reverse("user:user_anime_list", kwargs={"pk": self.user.pk, "username": self.user.username})

    @receiver(post_save, sender=User)
    def update_user_profile(sender, instance, created, **kwargs):
        if created:
            UserListAnime.objects.create(user=instance)
        instance.userlistanime.save()


class ListAnime(models.Model):
    WATCHING = 'Watching'
    PLANNING = 'Planning'
    COMPLETED = 'Completed'
    DROPPED = 'Dropped'
    ONHOLD = 'Onhold'
    MISSING = 'Missing'
    LIST_CHOICES = (
        (WATCHING, 'Oglądam'),
        (PLANNING, 'Planuję'),
        (COMPLETED, 'Obejrzane'),
        (DROPPED, 'Porzucone'),
        (ONHOLD, 'Wstrzymane'),
        (MISSING, 'Pomijam'),

    )
    user = models.ForeignKey(UserListAnime, on_delete=models.CASCADE, null=True, blank=True)
    anime = models.ForeignKey(Anime, on_delete=models.CASCADE, null=True, blank=True)
    type = models.CharField(max_length=30, choices=LIST_CHOICES, null=False, blank=False)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return '{}, {} - {}'.format(self.user, self.type, self.anime.title)

    @property
    def top_score(self):
        general = list(ScoreAnime.objects.filter(anime_title=self.anime.pk, user=self.user.user.pk).aggregate(
            Avg('general')).values())[0]
        story = list(ScoreAnime.objects.filter(anime_title=self.anime.pk, user=self.user.user.pk).aggregate(
            Avg('story')).values())[0]
        graphics = list(ScoreAnime.objects.filter(anime_title=self.anime.pk, user=self.user.user.pk).aggregate(
            Avg('graphics')).values())[0]
        character = list(ScoreAnime.objects.filter(anime_title=self.anime.pk, user=self.user.user.pk).aggregate(
            Avg('character')).values())[0]
        music = list(ScoreAnime.objects.filter(anime_title=self.anime.pk, user=self.user.user.pk).aggregate(
            Avg('music')).values())[0]
        score_user = 0
        try:
            score_user = ((general + story + graphics + music + character) / 5)
        except:
            pass
        return score_user

    def watched_episode(self):
        return WatchedAnime.objects.filter(episode__anime_title=self.anime.pk, watch__gte=1).count()

    def favorite(self):
        return FavoriteAnime.objects.filter(user__user=self.user.user, anime=self.anime).all()


class UserWatchedAnime(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    episode = models.ManyToManyField(EpisodsAnime, through='WatchedAnime')
    created_list = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return self.user.username

    @receiver(post_save, sender=User)
    def update_user_profile(sender, instance, created, **kwargs):
        if created:
            UserWatchedAnime.objects.create(user=instance)

        instance.userwatchedanime.save()


class WatchedAnime(models.Model):
    user = models.ForeignKey(UserWatchedAnime, on_delete=models.CASCADE)
    episode = models.ForeignKey(EpisodsAnime, on_delete=models.CASCADE)
    watch = models.SmallIntegerField(blank=True, null=True, default=0,
                                     validators=[MaxValueValidator(10000), MinValueValidator(1)])
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return '{}, {}, {}'.format(self.watch, self.user.user, self.episode.name_pl)


class UserFavoriteAnime(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    anime = models.ManyToManyField(Anime, through='FavoriteAnime')
    created_list = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return self.user.username

    @receiver(post_save, sender=User)
    def update_user_profile(sender, instance, created, **kwargs):
        if created:
            UserFavoriteAnime.objects.create(user=instance)
        instance.userfavoriteanime.save()


class FavoriteAnime(models.Model):
    user = models.ForeignKey(UserFavoriteAnime, on_delete=models.CASCADE)
    anime = models.ForeignKey(Anime, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return '{}, {}'.format(self.user.user, self.anime.title)
