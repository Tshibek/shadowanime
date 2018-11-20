from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include
from rest_framework import routers

from . import api
from . import views
app_name = 'index'
# router = routers.DefaultRouter()
# router.register(r'model', api.ModelViewSet)


# urlpatterns = (
#     # urls for Django Rest Framework API
#     path('api/v1/', include(router.urls)),
# )

urlpatterns = [
    # urls for Model
    path('', views.home, name='home'),

]
