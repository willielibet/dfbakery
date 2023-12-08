from django.urls import path
from . import views

urlpatterns = [
    path('', views.search_cakes, name='search_cakes'),
]
