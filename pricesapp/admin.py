from django.contrib import admin

# Register your models here.
#import your model
from .models import Price

# Register your models here.
#admin.site.register(Picture)

class PriceAdmin(admin.ModelAdmin):
    list_display = ('amount',)  # Fields to be displayed in the list view
    #search_fields = ('title', 'description')          # Fields to be searched

admin.site.register(Price, PriceAdmin)