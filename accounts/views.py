from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.cache import cache_page

from shadow.models import ReviewAnime, RecommendationAnime
from .forms import SignUpForm, FavoriteAnimeForm
from .models import ListAnime


# REGISTER

def SignUp(request):
    form = SignUpForm(request.POST)
    context = locals()
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.refresh_from_db()
            user.save()
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=user.username, password=raw_password)
            login(request, user)
            return redirect('index:home')
        else:
            form = SignUpForm()
    return render(request, 'account/signup.html', context)


# ANIME PROFILE LIST
@cache_page(60 * 60)
def ListAnimeView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username, type='Watching').all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST
@cache_page(60 * 60)
def ListAnimePlanningView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username, type='Planning').all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST
@cache_page(60 * 60)
def ListAnimeCompletedView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username, type='Completed').all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST
@cache_page(60 * 60)
def ListAnimeDroppedView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username, type='Dropped').all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST
@cache_page(60 * 60)
def ListAnimeOnholdView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username, type='Onhold').all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST
def ListAnimeMissingView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username, type='Missing').all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST
def ListAnimeAllView(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username).all()
    context = locals()
    return render(request, 'account/AnimeListView.html', context)


# ANIME PROFILE LIST ADD
def AddFavoriteAnime(request, pk, username):
    list_anime = ListAnime.objects.filter(user__user__pk=pk, user__user__username=username).all()
    if request.method == 'POST':
        form = FavoriteAnimeForm(instance=list_anime, data=request.POST)
        if form.is_valid():
            form.save()
    else:
        form = FavoriteAnimeForm(instance=list_anime)
    context = locals()
    return HttpResponse('done')


#           PROFILE VIEW
@cache_page(60 * 60)
def ProfilView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    anime_list = ListAnime.objects.filter(user__user__pk=pk).order_by('-last_updated').all()[:3]
    context = locals()
    return render(request, 'account/profileViewDetail.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def AchievementsView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/AchievementsView.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def RatesViews(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/RatesViews.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def FavouriteTags(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/FavouriteTags.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def EditView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/EditView.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def SettingsView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/SettingsView.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def EditAccountView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/EditAccountView.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def ReviewsViewProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    review = ReviewAnime.objects.filter(user=pk).all()
    context = locals()
    return render(request, 'account/ReviewsViewProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def RecommendationViewProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    recom = RecommendationAnime.objects.filter(user=pk).all()
    context = locals()
    return render(request, 'account/RecommendationViewProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def CommentsViewProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/CommentsViewProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def ProfileCommentsView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/ProfileCommentsView.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def PostsViewProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/PostsViewProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def HistoryEditProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/HistoryEditProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def HistoryModerationProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/HistoryModerationProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def HistoryShoppingProfile(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/HistoryShoppingProfile.html', context)


#           PROFILE VIEW
@cache_page(60 * 60)
def FavouriteProfileView(request, pk, username):
    user = User.objects.get(pk=pk, username=username)
    context = locals()
    return render(request, 'account/FavouriteProfileView.html', context)


#           LOGOUT
def LogoutView(request):
    logout(request)
    return redirect('index:home')
