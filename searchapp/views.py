from django.shortcuts import render
from django.db.models import Q
from galleryapp.models import GalleryPicture
from descriptions.models import PictureDescription
from pricesapp.models import Price

def search_cakes(request):
    query = request.GET.get('q', '')
    price_query = request.GET.get('price', '')

    # Base query for GalleryPicture
    gallery_lookups = Q(title__icontains=query) | \
                      Q(color__icontains=query) | \
                      Q(flavor__icontains=query) | \
                      Q(cake_type__icontains=query) | \
                      Q(occasion__icontains=query)

    # Extending the query to include fields from PictureDescription
    #gallery_lookups |= Q(description_link__title__icontains=query) | \
    #                   Q(description_link__description__icontains=query)
    gallery_lookups |= Q(description_link__description__icontains=query)

    # Handling the price filter
    if price_query:
        try:
            price_amount = float(price_query)
            gallery_lookups &= Q(price__amount=price_amount)
        except ValueError:
            # Handle invalid price input, e.g., log an error or pass
            pass

    # Applying the filter
    cakes = GalleryPicture.objects.filter(gallery_lookups)

    message = "No cake found!" if not cakes else ''

    return render(request, 'searchapp/search_results.html', {'cakes': cakes, 'message': message})
