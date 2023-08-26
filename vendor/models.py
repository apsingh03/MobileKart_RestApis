from django.db import models


# Create your models here.
class Category(models.Model):
    cat_name = models.CharField(max_length=200)
    date = models.CharField(max_length=50, null=True)


class SubCategory(models.Model):
    catId = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_cat_name = models.CharField(max_length=200)
    date = models.CharField(max_length=50, null=True)


class Taxes(models.Model):
    tax_name = models.CharField(max_length=200, null=True)
    tax_value = models.IntegerField()
    date = models.CharField(max_length=50, null=True)


class Shipping(models.Model):
    shipping_state_name = models.CharField(max_length=200, null=True)
    shipping_value = models.IntegerField()
    date = models.CharField(max_length=50, null=True)


class vendorSignup(models.Model):
    ven_name = models.CharField(max_length=200)
    ven_email = models.EmailField(max_length=200, unique=True)
    ven_pass = models.CharField(max_length=200)
    ven_isLogged = models.BooleanField(null=True)
    date = models.CharField(max_length=50, null=True)


class addProduct(models.Model):
    venId = models.ForeignKey(vendorSignup, on_delete=models.CASCADE)
    CategoryId = models.ForeignKey(Category, on_delete=models.CASCADE)
    subCategoryId = models.ForeignKey(SubCategory, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    mrp = models.IntegerField()
    discountPercent = models.IntegerField()
    productType = models.CharField(max_length=200)
    taxStatus = models.CharField(max_length=200)
    taxClass = models.CharField(max_length=200, null=True)
    shippingStatus = models.CharField(max_length=200, null=True)
    shippingAmount = models.IntegerField(null=True)
    totalUnits = models.IntegerField()
    stockStatus = models.CharField(max_length=200)
    trackQty = models.CharField(max_length=200)
    productDescription = models.TextField(null=True)
    image1 = models.CharField(max_length=1000, null=True)
    image2 = models.CharField(max_length=1000, null=True)
    image3 = models.CharField(max_length=1000, null=True)
    image4 = models.CharField(max_length=1000, null=True)
    image5 = models.CharField(max_length=1000, null=True)
    setFeatured = models.BooleanField(default=0)
    # 0 false 1 true
    recycleBin = models.BooleanField(default=0)
    date = models.CharField(max_length=50, null=True)
