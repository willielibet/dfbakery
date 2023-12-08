from django.contrib import admin

# Register your models here.
from .models import PictureDescription

# Register your models here.
#admin.site.register(Picture)

class DescriptionPictureAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'image')  # Fields to be displayed in the list view
    #search_fields = ('title', 'description')          # Fields to be searched

admin.site.register(PictureDescription, DescriptionPictureAdmin)



