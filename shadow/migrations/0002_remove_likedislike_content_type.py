# Generated by Django 2.1.2 on 2018-11-19 13:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shadow', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='likedislike',
            name='content_type',
        ),
    ]