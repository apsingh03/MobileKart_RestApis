from rest_framework import serializers
from userApi.models import *
from userApi.serializers import *
from vendor.models import *


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category()
        fields = ["id", "cat_name"]


class SubCategorySerializer(serializers.ModelSerializer):
    catId = CategorySerializer()

    class Meta:
        model = SubCategory()
        fields = ["id", "sub_cat_name", "catId"]


class TaxesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Taxes()
        fields = ["id", "tax_name", "tax_value", "date"]


class ShippingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shipping()
        fields = ["id", "shipping_state_name", "shipping_value", "date"]


class vendorSignupSerializer(serializers.ModelSerializer):
    class Meta:
        model = vendorSignup()
        # exclude = ["ven_pass",  "ven_isLogged", "date"]
        fields = ["id", "ven_name", "ven_email"]


class addProductSerializer(serializers.ModelSerializer):
    CategoryId = CategorySerializer()
    subCategoryId = SubCategorySerializer()
    venId = vendorSignupSerializer()

    class Meta:
        model = addProduct()
        fields = [
            "id",
            "venId",
            "CategoryId",
            "subCategoryId",
            "name",
            "mrp",
            "discountPercent",
            "productType",
            "taxStatus",
            "taxClass",
            "shippingStatus",
            "shippingAmount",
            "totalUnits",
            "stockStatus",
            "trackQty",
            "productDescription",
            "image1",
            "image2",
            "image3",
            "image4",
            "image5",
            "setFeatured",
            "recycleBin",
            "date",
        ]
        # field = "__all__"
        # depth = 2
