from django.db.models import Q
from django.shortcuts import render
from .models import Manga

from django.views import generic


class MangaListView(generic.ListView):
    template_name = 'manga/MangaListView.html'
    paginate_by = 15
    def get_queryset(self, *args, **kwargs):
        qs = Manga.objects.all()
        query = self.request.GET.get("q", None)
        if query is not None:
            qs = qs.filter(
                Q(title__icontains=query)
            )
        return sorted(qs, key=lambda m: -m.top_score)

    def get_context_data(self, *args, **kwargs):
        context = super(MangaListView, self).get_context_data(*args, **kwargs)
        return context