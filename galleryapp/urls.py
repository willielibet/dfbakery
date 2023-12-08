from django.urls import path
from .views import galleryapp_view

urlpatterns = [
    path('', galleryapp_view, name='gallery'),
]
