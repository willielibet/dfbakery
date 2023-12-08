from django.shortcuts import render, get_object_or_404
from .models import PictureDescription  # Import your Picture model

# Create your views here.

def picture_description(request, picture_id):
    picture = get_object_or_404(PictureDescription, id=picture_id)
    return render(request, 'descriptions/description.html', {'picture': picture})