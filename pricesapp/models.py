from django.db import models

# Create your models here.
# model will have a one-to-one relationship 
# with both GalleryPicture and PictureDescription.
class Price(models.Model):
    amount = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    def __str__(self):
        return str(self.amount)