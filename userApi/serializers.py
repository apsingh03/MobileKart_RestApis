from rest_framework import serializers
from .models import *
from userApi.models import *
from vendor.serializers import *
from vendor.models import *


class UserSignupSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserSignUp
        fields = ["id", "u_fname", "u_lname", "u_email"]


class AddressSerializer(serializers.ModelSerializer):
    userId = UserSignupSerializer()

    class Meta:
        model = Address
        fields = [
            "id",
            "userId",
            "reciverName",
            "fullAddress",
            "landmark",
            "city",
            "state",
            "date",
        ]


class PlaceOrderSerializer(serializers.ModelSerializer):
    userId = UserSignupSerializer()
    addressId = AddressSerializer()

    class Meta:
        model = PlaceOrder
        fields = [
            "id",
            "userId",
            "addressId",
            "cartAmount",
            "paymentId",
            "paymentMode",
            "trackingNo",
            "status",
            "date",
        ]


class CartItemSerializer(serializers.ModelSerializer):
    userId = UserSignupSerializer()
    productId = addProductSerializer()
    placeOrderId = PlaceOrderSerializer()

    class Meta:
        model = CartItem
        fields = [
            "id",
            "userId",
            "productId",
            "placeOrderId",
            "qty",
            "orderPlacedStatus",
            "date",
        ]


class WishListSerializer(serializers.ModelSerializer):
    userId = UserSignupSerializer()
    productId = addProductSerializer()

    class Meta:
        model = WishList
        fields = ["id", "userId", "productId", "date"]
