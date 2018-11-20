from django.shortcuts import render
from django.views.generic import DetailView, ListView, UpdateView, CreateView
from .models import News
from anime.models import PlayerEpisode


def home(request):
    template_name = 'home.html'
    news = News.objects.all()[:3]
    anime_title = PlayerEpisode.objects.all().order_by('-created')[:20]
    context = locals()
    return render(request, template_name, context)
