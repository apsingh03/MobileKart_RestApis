from django.shortcuts import render, redirect

# Create your views here.
from django.http import JsonResponse, HttpResponse


def Home(request):
    return redirect("/swagger/")

