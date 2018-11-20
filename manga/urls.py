from django.urls import path
from . import views
app_name = 'manga'


urlpatterns = [
    path(r'', views.MangaListView.as_view(), name='manga_list'),
]