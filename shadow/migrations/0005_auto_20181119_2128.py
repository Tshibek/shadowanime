# Generated by Django 2.1.2 on 2018-11-19 20:28

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('anime', '0001_initial'),
        ('shadow', '0004_auto_20181119_1407'),
    ]

    operations = [
        migrations.CreateModel(
            name='LikeDislikeReview',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('vote', models.SmallIntegerField(choices=[(-1, 'Dislike'), (1, 'Like')])),
            ],
        ),
        migrations.CreateModel(
            name='ReviewAnime',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('description', models.TextField()),
                ('anime', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='anime.Anime')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.RenameModel(
            old_name='LikeDislike',
            new_name='LikeDislikeRecom',
        ),
        migrations.AddField(
            model_name='likedislikereview',
            name='review',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shadow.ReviewAnime'),
        ),
        migrations.AddField(
            model_name='likedislikereview',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
