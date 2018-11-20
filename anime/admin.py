from django.contrib import admin
from django.contrib.auth.models import User

from .models import Anime, ScoreAnime, TagAnime, EpisodsAnime, PlayerEpisode, ChildAnime
from accounts.models import UserListAnime, ListAnime, WatchedAnime,UserWatchedAnime, FavoriteAnime,UserFavoriteAnime



# Register your models here.

class ListAnimeInline(admin.TabularInline):
    model = ListAnime


class ListUserAdmin(admin.ModelAdmin):
    inlines = [ListAnimeInline]


class WatchedAnimeInline(admin.TabularInline):
    model = WatchedAnime


class WatchedUserAdmin(admin.ModelAdmin):
    inlines = [WatchedAnimeInline]


class FavoriteAnimeInline(admin.TabularInline):
    model = FavoriteAnime


class FavoriteAnimeAdmin(admin.ModelAdmin):
    inlines = [FavoriteAnimeInline]


class AnimeAdmin(admin.ModelAdmin):
    class Meta:
        model = Anime


class ScoreAnimeAdmin(admin.ModelAdmin):
    class Meta:
        model = ScoreAnime


class TagAnimeAdmin(admin.ModelAdmin):
    class Meta:
        model = TagAnime


class EpisodeAnimeAdmin(admin.ModelAdmin):
    class Meta:
        model = EpisodsAnime


class PlayerEpisodeAdmin(admin.ModelAdmin):
    class Meta:
        model = PlayerEpisode

class ChildAnimeAdmin(admin.ModelAdmin):
    class Meta:
        model = ChildAnime

admin.site.register(UserFavoriteAnime, FavoriteAnimeAdmin)
admin.site.register(UserWatchedAnime, WatchedUserAdmin)
admin.site.register(UserListAnime, ListUserAdmin)
admin.site.register(Anime, AnimeAdmin)
admin.site.register(ChildAnime, ChildAnimeAdmin)
admin.site.register(EpisodsAnime, EpisodeAnimeAdmin)
admin.site.register(PlayerEpisode, PlayerEpisodeAdmin)
admin.site.register(ScoreAnime, ScoreAnimeAdmin)
admin.site.register(TagAnime, TagAnimeAdmin)
