# Generated by Django 2.1.2 on 2018-11-21 21:21

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='watchedanime',
            name='watch',
            field=models.SmallIntegerField(blank=True, default=0, null=True, validators=[django.core.validators.MaxValueValidator(10000), django.core.validators.MinValueValidator(1)]),
        ),
    ]
