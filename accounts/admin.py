from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from . import models


# Register your models here.
class ProfileInline(admin.StackedInline):
    model = models.Profile
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'

class AnimeUserList(admin.StackedInline):
    model = models.UserListAnime
    can_delete = False
    verbose_name_plural = 'UserListAnime'
    fk_name = 'user'

class WatchedAnimeUser(admin.StackedInline):
    model = models.UserWatchedAnime
    can_delete = True
    verbose_name_plural = 'UserWatchedAnime'
    fk_name = 'user'

class FavoriteAnimeUser(admin.StackedInline):
    model = models.UserFavoriteAnime
    can_delete = True
    verbose_name_plural = 'UserFavoriteAnime'
    fk_name = 'user'

class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline, AnimeUserList, WatchedAnimeUser, FavoriteAnimeUser, )

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)


class OnlineUserActivityAdmin(admin.ModelAdmin):
    list_display = ('user', 'last_activity',)
    search_fields = ['user__username', ]
    list_filter = ['last_activity']

    def get_ordering(self, request):
        return ['last_activity']


class RoleUserAdmin(admin.ModelAdmin):
    class Meta:
        model = models.RoleUser


admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)
admin.site.register(models.RoleUser, RoleUserAdmin)
admin.site.register(models.Profile, OnlineUserActivityAdmin)
