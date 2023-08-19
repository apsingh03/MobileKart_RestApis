from django.db import models
from vendor.models import *

# Create your models here.

from django.db import models


class UserSignUp(models.Model):
    u_fname = models.CharField(max_length=30)
    u_lname = models.CharField(max_length=30)
    u_email = models.CharField(max_length=50)
    u_password = models.TextField()


class Cart(models.Model):

    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)
    productId = models.ForeignKey(addProduct, on_delete=models.CASCADE)
    qty = models.IntegerField(null=True)
    orderPlacedStatus = models.BooleanField(default=0)
    date = models.DateTimeField()


class Address(models.Model):
    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)
    reciverName = models.CharField(max_length=30, null=True)
    fullAddress = models.CharField(max_length=30)
    landmark = models.CharField(max_length=30)
    city = models.CharField(max_length=30)
    state = models.CharField(max_length=30)
    date = models.DateTimeField()


class PlaceOrder(models.Model):
    userId = models.ForeignKey(UserSignUp, on_delete=models.CASCADE)

    addressId = models.ForeignKey(Address, on_delete=models.CASCADE)
    productsArray = models.CharField(max_length=100)
    # qty = models.IntegerField(null=True)
    cartAmount = models.IntegerField()
    paymentId = models.IntegerField(null=True)
    paymentMode = models.CharField(max_length=30)
    trackingNo = models.IntegerField()
    status = models.IntegerField()
    date = models.DateTimeField()
