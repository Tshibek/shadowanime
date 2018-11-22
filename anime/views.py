import json

from django.contrib.contenttypes.models import ContentType
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import generic
from django.views.decorators.cache import cache_page
from django.views.generic.base import View

from .models import Anime, EpisodsAnime
from shadow.models import RecommendationAnime, ReviewAnime


# Create your views here.
@method_decorator(cache_page(60 * 60), name='dispatch')
class AnimeListView(generic.ListView):
    template_name = "anime/AnimeListView.html"
    paginate_by = 15

    def get_queryset(self, *args, **kwargs):
        qs = Anime.objects.all()
        query = self.request.GET.get("q", None)
        if query is not None:
            qs = qs.filter(
                Q(title__icontains=query)
            )
        return sorted(qs, key=lambda m: -m.top_score)

    def get_context_data(self, *args, **kwargs):
        context = super(AnimeListView, self).get_context_data(*args, **kwargs)
        return context


@cache_page(60 * 60)
def AnimeDetailView(request, pk, slug):
    anime_model = Anime.objects.get(pk=pk, slug=slug)
    recom = RecommendationAnime.objects.filter(from_anime=pk).all()
    review = ReviewAnime.objects.filter(anime=pk).all()
    context = locals()
    return render(request, 'anime/AnimeDetailView.html', context)


@cache_page(60 * 60)
def AnimeEpisodeView(request, pk, slug):
    anime_model = Anime.objects.get(pk=pk, slug=slug)
    context = locals()
    return render(request, 'anime/AnimeEpisodeView.html', context)


@cache_page(60 * 60)
def AnimeEpisodeDetailView(request, pk, slug, anime):
    anime_model = Anime.objects.get(pk=pk, slug=slug)
    episode_model = EpisodsAnime.objects.get(anime_title__pk=pk, anime_title__slug=slug, pk=anime)
    context = locals()
    return render(request, 'anime/AnimeEpisodeDetailView.html', context)


@cache_page(60 * 60)
def AnimeRecommendations(request, pk, slug):
    anime_model = Anime.objects.get(pk=pk, slug=slug)
    recom = RecommendationAnime.objects.filter(from_anime=pk).all()
    context = locals()
    return render(request, 'anime/AnimeRecommendation.html', context)


@cache_page(60 * 60)
def AnimeReview(request, pk, slug):
    anime_model = Anime.objects.get(pk=pk, slug=slug)
    review = ReviewAnime.objects.filter(anime=pk).all()
    context = locals()
    return render(request, 'anime/AnimeReview.html', context)
