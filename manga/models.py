from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from django.urls import reverse
from django_extensions.db import fields as extension_fields
from sorl.thumbnail import ImageField

def user_directory_path(instance, filename):
    return 'img/manga/{0}-{1}/{2}'.format(instance.pk, instance.title, filename)


class Manga(models.Model):
    TYPE = (
        ('Doujin', 'Doujin'),
        ('Manga', 'Manga'),
        ('Manhua', 'Manhua'),
        ('Manhwa', 'Manhwa'),
        ('Light Novel', 'Light Novel'),
        ('One Shot', 'One Shot'),
    )
    STATUS = (
        ('Publikowane', 'Publikowane'),
        ('Zapowiedź', 'Zapowiedź'),
        ('Zakończone', 'Zakończone'),
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
    title_roman = models.CharField(max_length=191, blank=True, default='')
    title_kanji = models.CharField(max_length=191, blank=True, default='')
    description = models.TextField(max_length=2000, default='', blank=True)
    picture = ImageField(upload_to=user_directory_path, default='img/manga/default/brak_obrazka.jpg', blank=True)
    type_series = models.CharField(max_length=5, choices=TYPE, default='')
    pub_date = models.DateField(blank=True, null=True)
    end_date = models.DateField(blank=True, null=True)
    status_anime = models.CharField(max_length=20, choices=STATUS, default='')
    mpaa = models.CharField(max_length=5, choices=AGE_GROUP, default='')
    number_tom = models.CharField(max_length=20, default='', null=True, blank=True)
    number_chapter = models.CharField(max_length=20, default='', null=True, blank=True)
    created_user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, editable=True)

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

    # def get_absolute_url(self):
    #     return reverse('manga:manga_detail', args=(self.pk, self.slug), )


class ScoreManga(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    manga_title = models.ForeignKey(Manga, on_delete=models.CASCADE, related_name='manga')
    general = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    story = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    character = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    graphics = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])
    music = models.IntegerField(blank=True, default=0, validators=[MaxValueValidator(10), MinValueValidator(1)])

    class Meta:
        unique_together = (("user", "manga_title"),)

    def __str__(self):
        return str(self.general)

# class ChapterManga(models.Model):
#     TYP = (
#         ('Standardowy', 'Standardowy'),
#         ('Omake', 'Omake'),
#         ('Extra', 'Extra'),
#         ('Special', 'Special'),
#         ('Inny', 'Inny'),
#     )
#     TITLE = (
#         ('Oficjalny', 'Oficjalny'),
#         ('Alternatywny', 'Alternatywny'),
#         ('Przetłumaczony(oficjalny)', 'Przetłumaczony(oficjalny)'),
#         ('Przetłumaczony', 'Przetłumaczony'),
#     )
#     number_chapter = models.CharField(max_length=50)
#     number_tom = models.CharField(max_length=50)
#     type_chapter = models.CharField(max_length=50, choices=TYP)
#     data_pub = models.DateField()
#     title_jp = models.CharField(max_length=191)
#     title_pl = models.CharField(max_length=191)
#     title_en = models.CharField(max_length=191)
#     title_jp_type = models.CharField(max_length=50, choices=TITLE)
#     title_pl_type = models.CharField(max_length=50, choices=TITLE)
#     title_en_type = models.CharField(max_length=50, choices=TITLE)