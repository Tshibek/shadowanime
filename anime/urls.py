from django.contrib.auth.decorators import login_required
from django.urls import path
from . import views


app_name = 'series'

urlpatterns = [
    path(r'', views.AnimeListView.as_view(), name='anime_list'),
    path(r'<int:pk>-<slug:slug>', views.AnimeDetailView, name='anime_detail'),
    path(r'<int:pk>-<slug:slug>/episode', views.AnimeEpisodeView, name='anime_episode_list'),
    path(r'external-video/<int:pk>-<slug:slug>/view/<int:anime>', views.AnimeEpisodeDetailView,
         name='anime_episode_detail'),
    path(r'<int:pk>-<slug:slug>/recommendations', views.AnimeRecommendations, name='anime_recommendations'),
    path(r'<int:pk>-<slug:slug>/reviews', views.AnimeReview, name='anime_reviews'),

]
