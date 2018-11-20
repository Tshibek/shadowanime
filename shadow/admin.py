from django.contrib import admin
from .models import News, LastUpdate, RecommendationAnime, LikeDislikeRecom,LikeDislikeReview, ReviewAnime
# Register your models here.


admin.site.register(News)
admin.site.register(RecommendationAnime)
admin.site.register(LikeDislikeRecom)
admin.site.register(ReviewAnime)
admin.site.register(LikeDislikeReview)
admin.site.register(LastUpdate)