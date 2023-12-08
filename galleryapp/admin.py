from django.contrib import admin

#import your model
from .models import GalleryPicture
#from .models import Cake

# Register your models here.
#admin.site.register(Picture)

class GalleryPictureAdmin(admin.ModelAdmin):
    list_display = ('title', 'price','color', 'occasion', 'flavor', 'cake_type')  # Fields to be displayed in the list view
    #search_fields = ('title', 'description')          # Fields to be searched

admin.site.register(GalleryPicture, GalleryPictureAdmin)

#admin.site.register(Cake)
class SearchCakeAdmin(admin.ModelAdmin):
    list_display = ('title', 'color')  # Fields to be displayed in the list view
    #search_fields = ('title', 'description')          # Fields to be searched

#admin.site.register(GalleryPicture, SearchCakeAdmin)


