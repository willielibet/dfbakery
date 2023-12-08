# descriptions/urls.py
from django.urls import path
from .views import picture_description

urlpatterns = [
    path('picture/<int:picture_id>/', picture_description, name='picture_description'),
]
