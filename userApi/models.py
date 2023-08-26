from django.db import models
from vendor.models import *

# Create your models here.

from django.db import models


class UserSignUp(models.Model):
    u_fname = models.CharField(max_length=30)
    u_lname = models.CharField(max_length=30)
    u_email = models.EmailField(max_length=50, unique=True)
    u_password = models.TextField()
    date = models.CharField(max_length=50, null=True)


class Address(models.Model):
    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)
    reciverName = models.CharField(max_length=50, null=True)
    fullAddress = models.TextField()
    landmark = models.CharField(max_length=100)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    date = models.CharField(max_length=50, null=True)


class PlaceOrder(models.Model):
    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)
    addressId = models.ForeignKey(Address, on_delete=models.CASCADE, null=True)
    cartAmount = models.IntegerField(null=True)
    paymentId = models.IntegerField(null=True)
    paymentMode = models.CharField(max_length=30, null=True)
    trackingNo = models.IntegerField(null=True)
    status = models.BooleanField(default=0)
    date = models.CharField(max_length=50, null=True)


class CartItem(models.Model):
    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)
    productId = models.ForeignKey(addProduct, on_delete=models.CASCADE)
    placeOrderId = models.ForeignKey(PlaceOrder, on_delete=models.CASCADE, null=True)
    qty = models.IntegerField(null=True)
    orderPlacedStatus = models.BooleanField(default=0)
    date = models.CharField(max_length=50, null=True)


class WishList(models.Model):
    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)
    productId = models.ForeignKey(addProduct, on_delete=models.CASCADE)
    date = models.CharField(max_length=50, null=True)
