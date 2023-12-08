from django.shortcuts import render
from .models import GalleryPicture

# Create your views here.

#view to display pictures
def galleryapp_view(request):
    pictures = GalleryPicture.objects.all()
    return render(request, 'galleryapp/gallery.html', {'pictures': pictures})
