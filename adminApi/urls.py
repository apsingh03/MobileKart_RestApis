from django.contrib import admin
from django.urls import path , include
from adminApi import views

urlpatterns = [
    
    path('', views.adminHome , name="adminHome" ),
    path('signup', views.adminSignUp , name="adminHome" ),

]
