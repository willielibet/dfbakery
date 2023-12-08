from django.db import models

#import the price model from the pricesapp.
from pricesapp.models import Price


# Create your models here.
# descriptions/models.py

class PictureDescription(models.Model):
    title = models.CharField(max_length=100)
    image = models.ImageField(upload_to='pictures/')
    description = models.TextField()  # Add a description field
    price = models.OneToOneField(Price, on_delete=models.SET_NULL, null=True, blank=True)

    # ... the rest of your model
