from django.db import models

from descriptions.models import PictureDescription 
#import the price model from the pricesapp.
from pricesapp.models import Price


class GalleryPicture(models.Model):
    title = models.CharField(max_length=100)
    slug = models.SlugField(unique=True, blank=True)
    image = models.ImageField(upload_to='pictures/')
    description_link = models.ForeignKey(PictureDescription, on_delete=models.CASCADE)
    price = models.OneToOneField(Price, on_delete=models.SET_NULL, null=True, blank=True)

    color = models.CharField(max_length=75, null=True, blank=True)
    occasion = models.CharField(max_length=150, null=True, blank=True)
    flavor = models.CharField(max_length=75, null=True, blank=True)
    cake_type = models.CharField(max_length=150, null=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super(GalleryPicture, self).save(*args, **kwargs)


    def __str__(self):
        return self.title


