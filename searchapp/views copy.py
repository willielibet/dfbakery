from django.db.models import Q, TextField
from django.db.models.functions import Cast
from django.shortcuts import render
from galleryapp.models import GalleryPicture

def search_cakes(request):
    query = request.GET.get('q', '')
    #min_price = request.GET.get('min_price', '')
    #max_price = request.GET.get('max_price', '')
    #price = request.GET.get('price', '')
    price_query = request.GET.get('price', '')

    # Debugging: Print out the received query parameters
    print(f"Query: {query}, Price Query: {price_query}")

     # Start with an annotated queryset
    annotated_cakes = GalleryPicture.objects.annotate(
        price_as_string=Cast('price', TextField())
    )


    query_filter = Q()

    if query:
        query_filter |= Q(title__icontains=query) | Q(color__icontains=query) | Q(flavor__icontains=query) | Q(cake_type__icontains=query) | Q(occasion__icontains=query)


    # Add price range filters if provided
    #if min_price:
    #    try:
    #        min_price_value = float(min_price)
    #        query_filter &= Q(price__gte=min_price_value)
    #    except ValueError:
    #        pass  # handle invalid input

    #if max_price:
    #    try:
    #        max_price_value = float(max_price)
    #        query_filter &= Q(price__lte=max_price_value)
    #    except ValueError:
    #        pass  # handle invalid input


   # Treat the price as a string for search purposes
    if price_query:
        query_filter |= Q(price_as_string__icontains=price_query)

    # Using annotate to cast price to a string
    #cakes = GalleryPicture.objects.annotate(
    #    price_as_string=Cast('price', TextField())
    #).filter(query_filter)

    #if query_filter:
    #    cakes = GalleryPicture.objects.filter(query_filter)
    #else:
    #    cakes = GalleryPicture.objects.all()
        
    # Apply the filter to the annotated queryset
    cakes = annotated_cakes.filter(query_filter)

    message = "No cake found!" if not cakes else ''

    return render(request, 'searchapp/search_results.html', {'cakes': cakes, 'message': message})

