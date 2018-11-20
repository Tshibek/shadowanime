from django.contrib.auth.models import User
from django.db import models

# Create your models here.

class Tag(models.Model):
    TYP_TAGU = (
        ('Gatunki', 'Gatunki'),
        ('Grupy docelowa', 'Grupy docelowa'),
        ('Rodzaje postaci', 'Rodzaje postaci'),
        ('Miejsce i czas', 'Miejsce i czas'),
        ('Pozostałe tagi', 'Pozostałe tagi'),
        ('Studio', 'Studio'),
        ('Typy produkcji', 'Typy produkcji'),
        ('Wydawnictwa', 'Wydawnictwa'),
        ('Pierwowzór', 'Pierwowzór'),
    )
    name = models.CharField(max_length=191)
    type = models.CharField(max_length=20, choices=TYP_TAGU)
    language = models.CharField(max_length=6, default='Polski', editable=False)
    parent = models.CharField(max_length=191, blank=True, null=True, default=' ')
    description = models.TextField(max_length=2000, default='', blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    created_user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, editable=True)
    message = models.TextField(null=True, blank=True, default='')
    Published = models.BooleanField(default=False)

    class Meta:
        unique_together = (("name", "type"),)

    def __str__(self):
        return '{} - {}'.format(self.name, self.type)