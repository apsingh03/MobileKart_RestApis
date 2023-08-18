from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse, HttpResponse


def Home(request):

    allPaths = {
        "home": "/",
        "adminApi": "/adminApi",
        "userApi": "/userApi",
        "vendorApi": "/vendorApi",
        "swagger": "/swagger",
        "redoc": "/redoc",
    }

    # return JsonResponse({'message': 'success its working'} )
    return JsonResponse(allPaths)
