from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse , JsonResponse

def adminHome(request):
    urls = {
        'data' : "Welcome to ADMIN Home ",
        'Home App' : '/',
        'adminSignUp' : '/adminApi/signup'
    }
    return JsonResponse(urls)


def adminSignUp(request):
    return HttpResponse("Admin Sign UP")