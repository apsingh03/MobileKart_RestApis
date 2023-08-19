from django.contrib import admin
from django.urls import path, include
from userApi import views

urlpatterns = [
    path("", views.user_Home, name="Home"),
    path("demo", views.demo, name="demo"),
    path("signup", views.user_Signup_view, name="user_Signup_view"),
    path("addIn-cart", views.user_addInCart_view, name="user_addInCart_view"),
    path(
        "fetch-cart-byUserId/<str:userId>/",
        views.user_fetchCartByUserId_view,
        name="user_fetchCartByUserId_view",
    ),
    path(
        "update-cartqty-byproductid/<str:cartId>/<str:qtyMessage>/",
        views.user_updateCartQtyByProductID_view,
        name="user_updateCartQtyByProductID_view",
    ),
    path(
        "delete-cartItem/<str:userId>/<str:cartId>/",
        views.user_deleteCartItem_view,
        name="user_updateCartQtyByProductID_view",
    ),
    path(
        "add-address/<str:userId>/", views.user_address_view, name="user_address_view"
    ),
    path("userLogin/", views.user_Login_view, name="user_Login_view"),
    path("placeOrder/", views.user_PlaceOrder_view, name="user_PlaceOrder_view"),
]
