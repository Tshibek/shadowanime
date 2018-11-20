from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from django.db.models import Avg
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from sorl.thumbnail import ImageField
from django_extensions.db import fields as extension_fields

from accounts import models as model
from tags.models import Tag
from embed_video.fields import EmbedVideoField

# Create your models here.
def user_directory_path(instance, filename):
    return 'img/anime/{}-{}/{}'.format(instance.id, instance.title, filename)


# Create your models here.


class Anime(models.Model):
    TYPE = (
        ('TV', 'TV'),
        ('ONA', 'ONA'),
        ('FILM', 'FILM'),
        ('OVA', 'OVA'),
    )
    STATUS = (
        ('Emitowane', 'Emitowane'),
        ('Zapowiedź', 'Zapowiedź'),
        ('Zakończone', 'Zakończone'),
        ('Deklaracja', 'Deklaracja'),
    )
    AGE_GROUP = (
        ('', '--'),
        ('G', 'G - Wszystkie grupy wiekowe'),
        ('PG', 'PG - Materiał nieodpowiedni dla dzieci'),
        ('PG-13', 'PG-13 - Materiał dla osób powyżej 13 roku życia'),
        ('R', 'R - Materiały dla osób powyżej 17 roku życia (przemoc, wulgaryzmy)'),
        ('R+', 'R+ - Niektóre materiały mogą być nieodpowiednie dla osób poniżej 17 roku życia, zawiera nagość'),
        ('Rx', 'Rx - Materiały są nieodpowiednie dla osób poniżej 18 roku życia, zawierają pornografię'),
        ('Ry', 'Ry - Materiały są nieodpowiednie dla osób poniżej 18 roku życia, zawierają homoseksualną pornografię'),
    )

    title = models.CharField(max_length=200)
    slug = extension_fields.AutoSlugField(populate_from='title', blank=True)
    title_en = models.CharField(max_length=200, blank=True, default='', null=True)
    title_roman = models.CharField(max_length=191, blank=True, default='', null=True)
    title_kanji = models.CharField(max_length=191, blank=True, default='', null=True)
    description = models.TextField(max_length=2000, default='', blank=True)
    picture = ImageField(upload_to=user_directory_path, default='img/anime/default/brak_obrazka.jpg', blank=True)
    type_series = models.CharField(max_length=5, choices=TYPE, default='')
    pub_date = models.DateField(blank=True, null=True)
    end_date = models.DateField(blank=True, null=True)
    status_anime = models.CharField(max_length=20, choices=STATUS, default='')
    mpaa = models.CharField(max_length=5, choices=AGE_GROUP, default='')
    number_episode = models.CharField(max_length=20, default='', null=True, blank=True)
    episode_time = models.CharField(max_length=20)

    created_user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, editable=True)

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('series:anime_detail', args=(self.pk, self.slug), )

    def scores(self):
        general = list(ScoreAnime.objects.filter(anime_title=self.pk, general__gte=1).aggregate(Avg('general')).values())[0]
        story = list(ScoreAnime.objects.filter(anime_title=self.pk, story__gte=1).aggregate(Avg('story')).values())[0]
        graphics = \
        list(ScoreAnime.objects.filter(anime_title=self.pk, graphics__gte=1).aggregate(Avg('graphics')).values())[0]
        music = list(ScoreAnime.objects.filter(anime_title=self.pk, music__gte=1).aggregate(Avg('music')).values())[0]
        character = \
        list(ScoreAnime.objects.filter(anime_title=self.pk, character__gte=1).aggregate(Avg('character')).values())[0]
        context = locals()
        return context

    def get_count_all(self):
        general_count = ScoreAnime.objects.filter(anime_title=self.pk, general__gte=1).count()
        graphics_count = ScoreAnime.objects.filter(anime_title=self.pk, graphics__gte=1).count()
        music_count = ScoreAnime.objects.filter(anime_title=self.pk, music__gte=1).count()
        story_count = ScoreAnime.objects.filter(anime_title=self.pk, story__gte=1).count()
        character_count = ScoreAnime.objects.filter(anime_title=self.pk, character__gte=1).count()
        context = locals()
        return context

    @property
    def top_score(self):
        general = list(ScoreAnime.objects.filter(anime_title=self.pk).aggregate(Avg('general')).values())[0]
        story = list(ScoreAnime.objects.filter(anime_title=self.pk).aggregate(Avg('story')).values())[0]
        graphics = list(ScoreAnime.objects.filter(anime_title=self.pk).aggregate(Avg('graphics')).values())[0]
        character = list(ScoreAnime.objects.filter(anime_title=self.pk).aggregate(Avg('character')).values())[0]
        music = list(ScoreAnime.objects.filter(anime_title=self.pk).aggregate(Avg('music')).values())[0]
        top = 0
        try:
            top = ((general + story + graphics + music + character) / 5)
        except:
            pass
        return top

    def get_tag(self):
        species = TagAnime.objects.filter(anime_title=self.pk, tag__type='Gatunki').all()
        type_character = TagAnime.objects.filter(anime_title=self.pk, tag__type='Rodzaje postaci').all()
        place_time = TagAnime.objects.filter(anime_title=self.pk, tag__type='Miejsce i czas').all()
        other_tag = TagAnime.objects.filter(anime_title=self.pk, tag__type='Pozostałe tagi').all()
        prototype = TagAnime.objects.filter(anime_title=self.pk, tag__type='Pierwowzór').all()
        studio = TagAnime.objects.filter(anime_title=self.pk, tag__type='Studio').all()
        context = locals()
        return context

    def get_episode(self):
        return EpisodsAnime.objects.filter(anime_title=self.pk).all()

    def get_episode_count(self):
        return EpisodsAnime.objects.filter(anime_title=self.pk).count()

    def get_animelist(self):
        watching = model.ListAnime.objects.filter(anime=self.pk, type='Watching').count()
        planning = model.ListAnime.objects.filter(anime=self.pk, type='Planning').count()
        completed = model.ListAnime.objects.filter(anime=self.pk, type='Completed').count()
        dropped = model.ListAnime.objects.filter(anime=self.pk, type='Dropped').count()
        onhold = model.ListAnime.objects.filter(anime=self.pk, type='Onhold').count()
        missing = model.ListAnime.objects.filter(anime=self.pk, type='Missing').count()
        favourite = model.FavoriteAnime.objects.filter(anime=self.pk).count()
        context = locals()
        return context



class ChildAnime(models.Model):
    TYPE = (
        ('Sequel', 'Sequel'),
        ('Prequel', 'Prequel'),
        ('Główna Historia', 'Główna Historia'),
        ('Historia Poboczna', 'Historia Poboczna'),
        ('Pełna Historia', 'Pełna Historia'),
        ('Podsumowanie', 'Podsumowanie'),
        ('Spin-off', 'Spin-off'),
        ('Postacie', 'Postacie'),
        ('Alternatywna Wersja', 'Alternatywna Wersja'),
        ('Alternatywny Świat', 'Alternatywny Świat'),
        ('Inne', 'Inne'),
    )
    anime = models.ForeignKey(Anime, on_delete=models.CASCADE, related_name='for_animes')
    child_anime = models.ForeignKey(Anime, on_delete=models.CASCADE, related_name='child_animes')
    type = models.CharField(choices=TYPE, default='', max_length=25)
    def __str__(self):
        return self.anime.title



class ScoreAnime(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    anime_title = models.ForeignKey(Anime, on_delete=models.CASCADE, related_name='anime')
    general = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    story = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    character = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    graphics = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    music = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])

    class Meta:
        unique_together = (("user", "anime_title"),)

    def __str__(self):
        return str(self.general)


class EpisodsAnime(models.Model):
    TYP = (
        ('standardowy', 'standardowy'),
        ('specjalny', 'specjalny'),
        ('OVA', 'OVA'),
    )
    anime_title = models.ForeignKey(Anime, on_delete=models.CASCADE)
    name_pl = models.CharField(max_length=191, blank=True, default='')
    name_eng = models.CharField(max_length=191, blank=True,default='')
    name_rom = models.CharField(max_length=191, blank=True,default='')
    name_kan = models.CharField(max_length=191, blank=True, default='')
    filler = models.BooleanField(default=False, blank=True)
    Published = models.BooleanField(default=False)
    special = models.BooleanField(default=False, blank=True)
    typ = models.CharField(max_length=30, choices=TYP)
    dlugosc = models.PositiveIntegerField(blank=True, default=25)
    numer = models.PositiveIntegerField()
    channel = models.CharField(max_length=191, blank=True, default='')
    premiera = models.DateField(blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    created_user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, editable=True)
    message = models.TextField(null=True, blank=True, default='')



    class Meta:
        unique_together = (("name_pl", "name_eng", "name_rom", "name_kan", "anime_title"),)
        ordering = ['-numer']

    def __str__(self):
        return '{}, {} - {}'.format(self.numer, self.anime_title.title, self.name_pl)

    def get_absolute_url(self):
        return reverse("series:anime_episode_detail", args=(self.anime_title.pk, self.anime_title.slug, self.pk),)

    def get_player(self):
        return PlayerEpisode.objects.filter(episode_anime=self.pk).order_by('-created').all()

    def new_player(self):
        return PlayerEpisode.objects.filter(episode_anime=self.pk).order_by('-created').all()



class TagAnime(models.Model):
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE)
    anime_title = models.ForeignKey(Anime, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    created_user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, editable=True)
    message = models.TextField(null=True, blank=True, default='')
    Published = models.BooleanField(default=False)

    class Meta:
        unique_together = (("anime_title", "tag"),)

    def __str__(self):
        return '{} - {} - {}'.format(self.anime_title.title, self.tag.name, self.tag.type)


class PlayerEpisode(models.Model):
    VOICE_LANG = (
        ('Japoński', 'Japoński'),
        ('Polski', 'Polski'),
        ('Angielski', 'Angielski'),
        ('Chiński', 'Chiński'),
        ('Koreański', 'Koreański'),
    )
    SUBS_LANG = (
        ('-', '--'),
        ('Japoński', 'Japoński'),
        ('Polski', 'Polski'),
        ('Angielski', 'Angielski'),
        ('Chiński', 'Chiński'),
        ('Koreański', 'Koreański'),
    )
    RESOLUTION = (
        ('-', '--'),
        ('<320p', '<320p'),
        ('360p', '360p'),
        ('480p', '480p'),
        ('720p', '720p'),
        ('1080p', '1080p'),
    )
    labels = ['player_1', 'player_2', 'player_3', 'player_4', 'player_5', 'player_6']
    for player_url in labels:
        locals()[player_url] = EmbedVideoField(blank=True, null=True, default='')
    del locals()['player_url']
    episode_anime = models.ForeignKey(EpisodsAnime, on_delete=models.CASCADE)
    voice_lang = models.CharField(max_length=20, choices=VOICE_LANG, default='VOICE_LANG.Japoński')
    subs_lang = models.CharField(max_length=20, choices=SUBS_LANG, default='VOICE_LANG.Polski')
    resolution = models.CharField(max_length=8, choices=RESOLUTION, default='RESOLUTION.480p')
    author_sub = models.CharField(max_length=191,default=' ')
    source_video = models.URLField(default=' ', blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    created_user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, editable=True)
    message = models.TextField(null=True, blank=True, default='')
    Published = models.BooleanField(default=False)

    class Meta:
        ordering = ['-created']
    def __str__(self):
        return str(self.pk)


# '{} - {} - {} - {}'.format(self.episode_anime.numer, self.episode_anime.name_pl, self.episode_anime.anime_title.title, self.player_1)


