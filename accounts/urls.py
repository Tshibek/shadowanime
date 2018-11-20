from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views

app_name = 'user'


urlpatterns = [
    path(r'user/register/', views.SignUp, name='register'),
    path(r'user/login/',  auth_views.LoginView.as_view(template_name = 'account/signin.html'), name = 'login'),

    # PROFIL
    path(r'user/<int:pk>-<slug:username>', views.ProfilView, name='profil'),
    path(r'user/<int:pk>-<slug:username>/achievements', views.AchievementsView, name='achievements_profil'),
    path(r'user/<int:pk>-<slug:username>/rates', views.RatesViews, name='rates_profil'),
    path(r'user/<int:pk>-<slug:username>/favourite-tags', views.FavouriteTags, name='favourite_tags_profil'),
    path(r'user/<int:pk>-<slug:username>/edit', views.EditView, name='edit_profil'),
    path(r'user/<int:pk>-<slug:username>/settings', views.SettingsView, name='settings_profil'),
    path(r'user/<int:pk>-<slug:username>/edit-account', views.EditAccountView, name='edit_account_profil'),
    path(r'user/<int:pk>-<slug:username>/reviews', views.ReviewsViewProfile, name='reviews_profil'),
    path(r'user/<int:pk>-<slug:username>/recommendation', views.RecommendationViewProfile, name='recommendation_profil'),
    path(r'user/<int:pk>-<slug:username>/comments', views.CommentsViewProfile, name='comments_profil'),
    path(r'user/<int:pk>-<slug:username>/profile-comments', views.ProfileCommentsView, name='user_comments_profil'),
    path(r'user/<int:pk>-<slug:username>/posts', views.PostsViewProfile, name='posts_profil'),
    path(r'user/<int:pk>-<slug:username>/edits', views.HistoryEditProfile, name='history_edit_profil'),
    path(r'user/<int:pk>-<slug:username>/moderations', views.HistoryModerationProfile, name='history_mod_profil'),
    path(r'user/<int:pk>-<slug:username>/shopping-history', views.HistoryShoppingProfile, name='history_shop_profil'),
    path(r'user/<int:pk>-<slug:username>/favourites', views.FavouriteProfileView, name='favourite_profil'),

    # ANIMELIST USER
    path(r'animelist/<int:pk>-<slug:username>', views.ListAnimeView, name='user_anime_list'),
    path(r'animelist/<int:pk>-<slug:username>/plan', views.ListAnimePlanningView, name='user_anime_list_plan'),
    path(r'animelist/<int:pk>-<slug:username>/completed', views.ListAnimeCompletedView, name='user_anime_list_completed'),
    path(r'animelist/<int:pk>-<slug:username>/dropped', views.ListAnimeDroppedView, name='user_anime_list_dropped'),
    path(r'animelist/<int:pk>-<slug:username>/hold', views.ListAnimeOnholdView, name='user_anime_list_hold'),
    path(r'animelist/<int:pk>-<slug:username>/skip', views.ListAnimeMissingView, name='user_anime_list_skip'),
    path(r'animelist/<int:pk>-<slug:username>/all', views.ListAnimeAllView, name='user_anime_list_all'),
    path(r'animelist/<int:pk>-<slug:username>/favorite', views.AddFavoriteAnime, name='add_favorite'),

    # LOGOUT
    path(r'user/logout/', views.LogoutView, name='logout')
]
