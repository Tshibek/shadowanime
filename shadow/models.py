from django.db import models
from django.contrib.auth.models import User
from django.db.models import Sum
from django.utils.dateformat import format
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
from django_extensions.db import fields as extension_fields
from sorl.thumbnail import ImageField

from anime.models import Anime


def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'img/news/{0}-{1}/{2}'.format(instance.id, instance.slug, filename)


class News(models.Model):
    user = models.ForeignKey(User, unique=False, on_delete=models.CASCADE)
    published = models.BooleanField(default=False, blank=True)
    title = models.CharField(max_length=200)
    slug = extension_fields.AutoSlugField(populate_from='title', unique=False)
    image_url = models.URLField(default="", blank=True, null=True)
    image = ImageField(upload_to=user_directory_path, default='img/news/default/brak_obrazka.jpg', blank=True,
                       null=True)
    content = models.TextField(max_length=30000)
    draft = models.BooleanField(default=True)
    updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    timestamp = models.DateTimeField()

    class Meta:
        ordering = ['-timestamp', '-updated']

    def __str__(self):
        return self.title

    def unix_time(self):
        return format(self.updated, 'U')


class LastUpdate(models.Model):
    updated = models.DateTimeField(auto_now=False, auto_now_add=True)

    def unix_time(self):
        return format(self.updated, 'U')

    def __str__(self):
        return self.unix_time()


class RecommendationAnime(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    from_anime = models.ForeignKey(Anime, on_delete=models.CASCADE, related_name='from_anime')
    to_anime = models.ForeignKey(Anime, on_delete=models.CASCADE, related_name='to_anime')
    created = models.DateTimeField(auto_now_add=True, editable=False)
    description = models.TextField()

    def __str__(self):
        return '{}, {} - {}'.format(self.user.username, self.from_anime.title, self.to_anime.title)

    def username(self):
        return self.user.username

    def likes(self):
        return LikeDislikeRecom.objects.filter(recom=self.pk, vote__gt=0).all()

    def dislikes(self):
        return LikeDislikeRecom.objects.filter(recom=self.pk, vote__lt=0).all()


class LikeDislikeManager(models.Manager):
    use_for_related_fields = True

    def likes(self):
        # We take the queryset with records greater than 0
        return self.get_queryset().filter(vote__gt=0)

    def dislikes(self):
        # We take the queryset with records less than 0
        return self.get_queryset().filter(vote__lt=0)

    def sum_rating(self):
        # We take the total rating
        return self.get_queryset().aggregate(Sum('vote')).get('vote__sum') or 0


class LikeDislikeRecom(models.Model):
    LIKE = 1
    DISLIKE = -1

    VOTES = (
        (DISLIKE, 'Dislike'),
        (LIKE, 'Like')
    )

    vote = models.SmallIntegerField(choices=VOTES)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    recom = models.ForeignKey(RecommendationAnime, on_delete=models.CASCADE)
    objects = LikeDislikeManager()

    def __str__(self):
        return '{}, {} - {}'.format(self.user, self.vote, self.recom)


class ReviewAnime(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    anime = models.ForeignKey(Anime, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    description = models.TextField()

    def __str__(self):
        return '{}, {}'.format(self.user.username, self.anime.title)

    def username(self):
        return self.user.username

    def likes(self):
        return LikeDislikeReview.objects.filter(review=self.pk, vote__gt=0).all()

    def dislikes(self):
        return LikeDislikeReview.objects.filter(review=self.pk, vote__lt=0).all()

    def sum_likes(self):
        return LikeDislikeReview.objects.filter(review=self.pk).all()


class LikeDislikeReview(models.Model):
    LIKE = 1
    DISLIKE = -1

    VOTES = (
        (DISLIKE, 'Dislike'),
        (LIKE, 'Like')
    )

    vote = models.SmallIntegerField(choices=VOTES)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    review = models.ForeignKey(ReviewAnime, on_delete=models.CASCADE)
    objects = LikeDislikeManager()

    def __str__(self):
        return '{}, {}, {} '.format(self.user.username, self.vote, self.review)

# class SeenRevivew(models.Model):
#     pass
#
# class ReadRevivew(models.Model):
#     pass
