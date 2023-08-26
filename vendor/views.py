from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from vendor.models import (
    Category,
    SubCategory,
    Taxes,
    Shipping,
    vendorSignup,
    addProduct,
)

from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.utils.html import strip_tags
from django.core import serializers
from datetime import datetime

from vendor.serializers import *
from userApi.serializers import *

import json
import jwt

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

# to add commans according to indian notation
import locale


class HelloView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        content = {"message": "Hello, GeeksforGeeks"}
        return Response(content)


# Create your views here.


def getCurrentDate():
    format_datetime = datetime.today()
    return format_datetime.strftime("%b %d %Y %H:%M:%S")


def formatINR(number):
    s, *d = str(number).partition(".")
    r = ",".join([s[x - 2 : x] for x in range(-3, -len(s), -2)][::-1] + [s[-3:]])
    return "".join([r] + d)


def vendor_Home(request):
    msg = {
        "PAGE": "WELCOME TO VENDOR API PAGE",
        "GO back": "/",
        "AddCategory_view": [
            {"methods": "POST , GET", "AddCategory_view": "/vendorApi/addcategory"}
        ],
        "AddSubCategory_view": [
            {
                "methods": "POST , GET",
                "AddSubCategory_view": "/vendorApi/add-sub-category",
            }
        ],
        "AddTax_view": [{"methods": "POST , GET", "AddTax_view": "/vendorApi/add-tax"}],
        "AddShipping_view": [
            {"methods": "POST , GET", "AddShipping_view": "/vendorApi/add-shipping"}
        ],
        "get-subcat-bycategory/<str:pk>/": [
            {
                "methods": "GET",
                "GetSubCategoryByID_view": "/vendorApi/get-subcat-bycategory/Mobiles/",
            }
        ],
        "Signup_view": [{"methods": "POST , GET", "Signup_view": "/vendorApi/signup"}],
        "Login_view": [{"methods": "POST", "Login_view": "/vendorApi/vendorLogin"}],
        "addProduct_view": [
            {"methods": "POST , GET", "addProduct_view": "/vendorApi/addproduct"}
        ],
        "filter-productdetail-bySlug/<str:pk>/": [
            {
                "methods": "GET",
                "FilterProductBySlug_view": "/vendorApi/filter-productdetail-bySlug/",
            }
        ],
        "set-featuredProduct-byId/<str:pk>/": [
            {
                "methods": "PUT",
                "SetFeaturedProductById_view": "/vendorApi/set-featuredProduct-byId/id/",
            }
        ],
        "update-productdetail-byId/<str:pk>/": [
            {
                "methods": "PUT",
                "UpdateProductByID_view": "/vendorApi/update-productdetail-byId/id/",
            }
        ],
        "delete-product-byId/<str:pk1>/<str:pk2>/": [
            {
                "methods": "DELETE",
                "DeleteProductByID_view": "/vendorApi/delete-product-byId/vendorID/ProductID/",
            }
        ],
        "duplicate-product-byId/<str:pk1>/<str:pk2>/": [
            {
                "methods": "POST",
                "DuplicateProductByID_view": "/vendorApi/duplicate-product-byId/vendorId/productId/",
            }
        ],
        "permanent-delete-product-byId/<str:pk1>/<str:pk2>/": [
            {
                "methods": "DELETE",
                "PermanentDeleteProductByID_view": "/vendorApi/permanent-delete-product-byId/vendorId/productId/",
            }
        ],
    }

    return JsonResponse(msg)



@api_view(["POST", "GET"])
def AddCategory_view(request):
    msg = {}

    if request.method == "POST":
        print("----------AddCategory_view----------")
        # print(request)

        categoryName = strip_tags(request.data["cat_name"])
        # print(categoryName)
        exist_category = Category.objects.filter(cat_name=categoryName).exists()

        if not exist_category:
            query = Category(cat_name=categoryName, date=getCurrentDate())
            query.save()

            msg = {
                "status": 200,
                "msg": "CategoryAdded",
            }
            return JsonResponse(msg)

        else:
            msg = {
                "status": 200,
                "msg": "CategoryAlreadyExist",
            }
            return JsonResponse(msg)

    if request.method == "GET":
        # print("----------Line no 59 GET VendorAPI----------")

        getCategory = Category.objects.all()
        getCategorySerializers = CategorySerializer(getCategory, many=True)

        msg = {
            "msg": "CategoryGETREQUEST",
            "fetchCategory": getCategorySerializers.data,
        }

        return Response(msg)



@api_view(["POST", "GET"])
def AddSubCategory_view(request):
    msg = {}

    if request.method == "POST":
        # print("----------Line no 107 POST VendorAPI----------")
        print(request)

        catIdd = strip_tags(request.data["catId"])
        sub_cat_namee = strip_tags(request.data["sub_cat_name"])

        # print(categoryName)
        exist_SubCategory = SubCategory.objects.filter(
            catId_id=catIdd, sub_cat_name=sub_cat_namee
        ).exists()

        if not exist_SubCategory:
            query = SubCategory(
                catId_id=catIdd, sub_cat_name=sub_cat_namee, date=getCurrentDate()
            )
            query.save()

            msg = {
                "status": 200,
                "msg": "SubCategoryAdded",
            }
            return JsonResponse(msg)

        else:
            msg = {
                "status": 200,
                "msg": "SubCategoryAlreadyExist",
            }
            return JsonResponse(msg)

    if request.method == "GET":

        getSubCategory = SubCategory.objects.all()

        getCategorySerializer = SubCategorySerializer(getSubCategory, many=True)

        msg = {
            "msg": "SubCategoryGETREQUEST",
            "fetchSubCategory": getCategorySerializer.data,
        }

        return Response(msg)



@api_view(["POST", "GET"])
def AddTax_view(request):
    msg = {}

    if request.method == "POST":
        print("----------Line no 208 POST AddTax_view----------")
        # print(request)

        tax_namee = strip_tags(request.data["tax_name"])
        tax_valuee = strip_tags(request.data["tax_value"])

        # print(categoryName)
        exist_taxes = Taxes.objects.filter(
            tax_name=tax_namee, tax_value=tax_valuee
        ).exists()

        if not exist_taxes:
            query = Taxes(
                tax_name=tax_namee, tax_value=tax_valuee, date=getCurrentDate()
            )
            query.save()

            msg = {
                "status": 200,
                "msg": "TaxClassAdded",
            }
            return JsonResponse(msg)

        else:
            msg = {
                "status": 200,
                "msg": "TaxClassAlreadyExist",
            }
            return JsonResponse(msg)

    if request.method == "GET":
        # print("----------Line no 200 GET VendorAPI----------")

        getTaxesObject = Taxes.objects.all()
        getTaxesObjectSerializer = TaxesSerializer(getTaxesObject, many=True)

        msg = {
            "msg": "TaxClassGETREQUEST",
            "TaxClass": getTaxesObjectSerializer.data,
        }

        return Response(msg)



@api_view(["POST", "GET"])
def AddShipping_view(request):
    msg = {}

    if request.method == "POST":
        print("----------POST AddShipping_view----------")
        # print(request)

        shipping_namee = strip_tags(request.data["shipping_state_name"])
        shipping_valuee = strip_tags(request.data["shipping_value"])

        # print(categoryName)
        exist_Shipping = Shipping.objects.filter(
            shipping_state_name=shipping_namee, shipping_value=shipping_valuee
        ).exists()

        if not exist_Shipping:
            query = Shipping(
                shipping_state_name=shipping_namee,
                shipping_value=shipping_valuee,
                date=getCurrentDate(),
            )
            query.save()

            msg = {
                "status": 200,
                "msg": "ShippingStateNameAdded",
            }
            return JsonResponse(msg)

        else:
            msg = {
                "status": 200,
                "msg": "ShippingStateNameAlreadyExist",
            }
            return JsonResponse(msg)

    if request.method == "GET":
        # print("----------Line no 200 GET VendorAPI----------")

        getShippingObject = Shipping.objects.all()
        getShippingObjectSerializer = ShippingSerializer(getShippingObject, many=True)

        msg = {
            "status": 200,
            "msg": "ShippingClassGETREQUEST",
            "ShippingClass": getShippingObjectSerializer.data,
        }

        return Response(msg)



@api_view(["GET"])
def GetSubCategoryByID_view(request, catId):
    msg = {}

    if request.method == "GET":
        # print("----------Line no 275 GET VendorAPI----------")
        # print("id- " , catId )

        getCategory = SubCategory.objects.filter(catId__id=catId).all()
        getCategorySerializer = SubCategorySerializer(getCategory, many=True)

        msg = {
            "msg": "SubCategoryGETREQUEST",
            "fetchSubCategory": getCategorySerializer.data,
        }

        return Response(msg)



@api_view(["POST"])
def Signup_view(request):
    msg = {}

    if request.method == "POST":
        # print("----------Line no 297 POST VendorAPI----------")

        fullname = strip_tags(request.data["fullname"])
        emailAddress = strip_tags(request.data["emailAddress"])
        passwords = strip_tags(request.data["passwords"])

        # print(categoryName)
        exist_email = vendorSignup.objects.filter(ven_email=emailAddress).exists()

        if not exist_email:
            query = vendorSignup(
                ven_name=fullname,
                ven_email=emailAddress,
                ven_pass=passwords,
                date=getCurrentDate(),
            )
            query.save()

            msg = {
                "status": 200,
                "msg": "VendorSignUpSuccessfull",
            }
            return JsonResponse(msg)

        else:
            msg = {
                "status": 200,
                "msg": "EmailAlreadyExist",
            }
            return JsonResponse(msg)



@api_view(["POST"])
def Login_view(request):
    msg = {}

    if request.method == "POST":
        # print("----------Line no 343 GET VendorAPI----------")

        loginEmailId = strip_tags(request.data["loginEmailId"])
        loginPasswords = strip_tags(request.data["loginPasswords"])

        getSignup = vendorSignup.objects.filter(ven_email=loginEmailId).exists()
        # print(getSignup)

        if getSignup:
            fetchDetails = vendorSignup.objects.filter(ven_email=loginEmailId).values()

            fetchedId = fetchDetails[0]["id"]
            fetchedName = fetchDetails[0]["ven_name"]
            fetchedEmail = fetchDetails[0]["ven_email"]
            fetchedPass = fetchDetails[0]["ven_pass"]
            fetchedIsLogged = fetchDetails[0]["ven_isLogged"]
            fetchedDate = fetchDetails[0]["date"]

            if fetchedPass == loginPasswords:
                payload_data = {
                    "fetchedId": fetchedId,
                    "fetchedName": fetchedName,
                    "fetchedEmail": fetchedEmail,
                    "fetchedIsLogged": fetchedIsLogged,
                }

                my_secret = "THISISMYSECRETKEYTOPROTECTDATA"

                token = jwt.encode(
                    payload=payload_data, key=my_secret, algorithm="HS256"
                )

                # print(token)

                msg = {
                    "status": 200,
                    "msg": "VendorLoggedIn",
                    "token": token,
                }

                return Response(msg)

            else:
                msg = {
                    "status": 200,
                    "msg": "Wrong Password",
                }

                return JsonResponse(msg)

        else:
            msg = {
                "status": 200,
                "msg": "Incorrect Email Address",
            }

            return JsonResponse(msg)



@api_view(["POST", "GET"])
def addProduct_view(request):
    msg = {}

    if request.method == "POST":

        try:

            vendorIdd = strip_tags(request.data["vendorId"])
            productNamee = strip_tags(request.data["productNamee"])
            productMrpp = strip_tags(request.data["productMrpp"])
            productDiscountt = strip_tags(request.data["productDiscountt"])
            productTypee = strip_tags(request.data["productTypee"])
            productCategoryy = strip_tags(request.data["productCategoryy"])
            productSubCategoryDataa = strip_tags(
                request.data["productSubCategoryDataa"]
            )
            productTaxTypee = strip_tags(request.data["productTaxTypee"])
            productTaxClassDataa = strip_tags(request.data["productTaxClassDataa"])
            productShippingStatuss = strip_tags(request.data["productShippingStatuss"])
            productFaree = strip_tags(request.data["productFaree"])
            productUnitss = strip_tags(request.data["productUnitss"])
            productStockStatuss = strip_tags(request.data["productStockStatuss"])
            productTrackQtyy = strip_tags(request.data["productTrackQtyy"])
            productImageLink1 = strip_tags(request.data["productImageLink11"])
            productImageLink2 = strip_tags(request.data["productImageLink22"])
            productImageLink3 = strip_tags(request.data["productImageLink33"])
            productImageLink4 = strip_tags(request.data["productImageLink44"])
            productImageLink5 = strip_tags(request.data["productImageLink55"])
            productDescriptionn = strip_tags(request.data["productDescriptionn"])

            # print("-----------------------------------------------------")
            # print("productNamee-> " , productNamee )
            # print("productMrpp-> " , productMrpp )
            # print("productDiscountt-> " , productDiscountt )
            # print("productTypee-> " , productTypee )
            # print("productCategoryy-> " , productCategoryy )
            # print("productSubCategoryDataa-> " , productSubCategoryDataa )
            # print("productTaxTypee-> " , productTaxTypee )
            # print("productTaxClassDataa-> " , productTaxClassDataa )
            # print("productShippingStatuss-> " , productShippingStatuss )
            # print("productFaree-> " , productFaree )
            # print("productUnitss-> " , productUnitss )
            # print("productStockStatuss-> " , productStockStatuss )
            # print("productTrackQtyy-> " , productTrackQtyy )
            # print("productImageLink1-> " , productImageLink1 )
            # print("productImageLink2-> " , productImageLink2 )
            # print("productImageLink3-> " , productImageLink3 )
            # print("productImageLink4-> " , productImageLink4 )
            # print("productImageLink5-> " , productImageLink5 )
            # print("productDescriptionn-> " , productDescriptionn )

            query = addProduct(
                venId_id=vendorIdd,
                name=productNamee,
                mrp=productMrpp,
                discountPercent=productDiscountt,
                productType=productTypee,
                CategoryId_id=productCategoryy,
                subCategoryId_id=productSubCategoryDataa,
                taxStatus=productTaxTypee,
                taxClass=productTaxClassDataa,
                shippingStatus=productShippingStatuss,
                shippingAmount=productFaree,
                totalUnits=productUnitss,
                stockStatus=productStockStatuss,
                trackQty=productTrackQtyy,
                productDescription=productDescriptionn,
                image1=productImageLink1,
                image2=productImageLink2,
                image3=productImageLink3,
                image4=productImageLink4,
                image5=productImageLink5,
                date=getCurrentDate(),
            )

            query.save()

            msg = {"status": 200, "msg": "ProductAddedSuccessfully"}

            return JsonResponse(msg)

        except Exception as e:
            # print("------------------error on line no 404--------------")
            print("518 Exception Error ", e)

            errorMsg = "Error In - " + str(e)

            msg = {"msg": errorMsg}

            return JsonResponse(msg)

    if request.method == "GET":
        getAllProducts = addProduct.objects.all().order_by("-id")
        getAllProductsSerializer = addProductSerializer(getAllProducts, many=True)

        msg = {
            "status": 200,
            "msg": "addProductGETRequest",
            "getAllProducts": getAllProductsSerializer.data,
        }

        return Response(msg)



@api_view(["GET"])
def FilterProductBySlug_view(request, filterSlug):
    msg = {}

    if request.method == "GET":
        # print("----------Line no 275 GET VendorAPI----------")
        # print("pk- ", pk)

        extractPk = filterSlug.split("-")

        # print("extractPk- ", extractPk)

        filterByCategory = extractPk[0]

        catExistQuery = addProduct.objects.filter(
            CategoryId__cat_name=filterByCategory
        ).exists()

        if catExistQuery:
            #  MEANS CATEGORY
            #  http://localhost:8000/vendorApi/filter-productdetail-bySlug/Mobiles/

            if len(extractPk) == 1:
                # print("-----------1")
                # filter by Category

                getProduct = addProduct.objects.filter(
                    CategoryId__cat_name=filterByCategory
                ).all()

                # print( "Category - " ,  getProduct )

                getProductSerializer = addProductSerializer(getProduct, many=True)

                msg = {
                    "msg": "FilterProductGETREQUEST",
                    "fetchProduct": getProductSerializer.data,
                }

                return Response(msg)

            else:
                # means 2 slug

                filterBySubCategory = extractPk[1]
                subCatExistQuery = addProduct.objects.filter(
                    subCategoryId__sub_cat_name=filterBySubCategory
                ).exists()

                if subCatExistQuery:
                    #  MEANS CATEGORY AND SUBCATEGORY
                    #  http://localhost:8000/vendorApi/filter-productdetail-bySlug/Mobiles-Samsung/

                    if len(extractPk) == 2:
                        # print("-----------2" , filterByCategory , "  " , filterBySubCategory  )
                        # filter by sub cat

                        getProduct = addProduct.objects.filter(
                            CategoryId__cat_name=filterByCategory,
                            subCategoryId__sub_cat_name=filterBySubCategory,
                        ).all()

                        getProductSerializer = addProductSerializer(
                            getProduct, many=True
                        )

                        msg = {
                            "msg": "FilterProductGETREQUEST",
                            "fetchProduct": getProductSerializer.data,
                        }

                        return Response(msg)

                    #  MEANS CATEGORY , SUBCATEGORY , id , name
                    #  http://localhost:8000/vendorApi/filter-productdetail-bySlug/Mobiles-Samsung/

                    if len(extractPk) == 3:
                        # print("-----------3")
                        # filter by id
                        #
                        filterById = extractPk[2]

                        getProduct = addProduct.objects.filter(id=filterById).all()

                        getProductSerializer = addProductSerializer(
                            getProduct, many=True
                        )

                        msg = {
                            "msg": "FilterProductGETREQUEST",
                            "fetchProduct": getProductSerializer.data,
                        }

                        return Response(msg)

                else:
                    msg = {
                        "msg": "SubCategoryDoesNotExist",
                    }

                    return Response(msg)

        else:
            msg = {
                "msg": "CategoryDoesNotExist",
            }

            return Response(msg)

    return Response(msg)



@api_view(["PUT"])
def SetFeaturedProductById_view(request, productId, featuredStatus):
    msg = {}

    if request.method == "PUT":
        # print("----------Line no 275 GET VendorAPI----------")
        # print("id- " , productId  , featuredStatus)

        # getCategory = addProduct.objects.filter(id = pk1).values()
        query = addProduct.objects.filter(id=productId).exists()

        if query:
            if featuredStatus == "notFeatured":
                queryGet = addProduct.objects.get(id=productId)
                queryGet.setFeatured = 1
                queryGet.save()

                msg = {"status": 200, "msg": "ProductSetAsFeatured"}

                return JsonResponse(msg)

            if featuredStatus == "itsFeatured":
                queryGet = addProduct.objects.get(id=productId)
                queryGet.setFeatured = 0
                queryGet.save()

                msg = {"status": 200, "msg": "RemovedFromFeatured"}

                return JsonResponse(msg)


@api_view(["PUT"])
def UpdateProductByID_view(request, productId):
    msg = {}

    if request.method == "PUT":

        try:

            vendorIdd = strip_tags(request.data["vendorId"])
            productNamee = strip_tags(request.data["productNamee"])
            productMrpp = strip_tags(request.data["productMrpp"])
            productDiscountt = strip_tags(request.data["productDiscountt"])
            productTypee = strip_tags(request.data["productTypee"])
            productCategoryy = strip_tags(request.data["productCategoryy"])
            productSubCategoryDataa = strip_tags(
                request.data["productSubCategoryDataa"]
            )
            # productSubCategoryDataa = 3
            productTaxTypee = strip_tags(request.data["productTaxTypee"])
            productTaxClassDataa = strip_tags(request.data["productTaxClassDataa"])
            productShippingStatuss = strip_tags(request.data["productShippingStatuss"])
            productFaree = strip_tags(request.data["productFaree"])
            productUnitss = strip_tags(request.data["productUnitss"])
            productStockStatuss = strip_tags(request.data["productStockStatuss"])
            productTrackQtyy = strip_tags(request.data["productTrackQtyy"])
            productImageLink1 = strip_tags(request.data["productImageLink11"])
            productImageLink2 = strip_tags(request.data["productImageLink22"])
            productImageLink3 = strip_tags(request.data["productImageLink33"])
            productImageLink4 = strip_tags(request.data["productImageLink44"])
            productImageLink5 = strip_tags(request.data["productImageLink55"])
            productDescriptionn = strip_tags(request.data["productDescriptionn"])

            # print("-----------------------------------------------------")

            # print("product id- " , productId )
            # print("vendorIdd-> " , vendorIdd )
            # print("productNamee-> " , productNamee )
            # print("productMrpp-> " , productMrpp )
            # print("productDiscountt-> " , productDiscountt )
            # print("productTypee-> " , productTypee )

            # print("productSubCategoryDataa-> " , productSubCategoryDataa )
            # print("productTaxTypee-> " , productTaxTypee )
            # print("productTaxClassDataa-> " , productTaxClassDataa )
            # print("productShippingStatuss-> " , productShippingStatuss )
            # print("productFaree-> " , productFaree )
            # print("productUnitss-> " , productUnitss )
            # print("productStockStatuss-> " , productStockStatuss )
            # print("productTrackQtyy-> " , productTrackQtyy )
            # print("productImageLink1-> " , productImageLink1 )
            # print("productImageLink2-> " , productImageLink2 )
            # print("productImageLink3-> " , productImageLink3 )
            # print("productImageLink4-> " , productImageLink4 )
            # print("productImageLink5-> " , productImageLink5 )
            # print("productDescriptionn-> " , productDescriptionn )

            queryybn = addProduct.objects.filter(id=productId).update(
                venId_id=vendorIdd,
                name=productNamee,
                mrp=productMrpp,
                discountPercent=productDiscountt,
                productType=productTypee,
                CategoryId=productCategoryy,
                subCategoryId=productSubCategoryDataa,
                taxStatus=productTaxTypee,
                taxClass=productTaxClassDataa,
                shippingStatus=productShippingStatuss,
                shippingAmount=productFaree,
                totalUnits=productUnitss,
                stockStatus=productStockStatuss,
                trackQty=productTrackQtyy,
                productDescription=productDescriptionn,
                image1=productImageLink1,
                image2=productImageLink2,
                image3=productImageLink3,
                image4=productImageLink4,
                image5=productImageLink5,
                date=getCurrentDate(),
            )

            msg = {"status": 200, "msg": "ProductUpdatedSuccessfully"}

            return JsonResponse(msg)

        except Exception as e:
            # print("------------------error on line no 886--------------")
            print("766 Exception -", e)

            errorMsg = "Error In - " + str(e)

            # print(errorMsg)

            msg = {"msg": errorMsg}

            return JsonResponse(msg)



@api_view(["DELETE"])
def DeleteProductByID_view(request, vendorId, productId):
    msg = {}

    if request.method == "DELETE":
        # print("----------Line no 257 POST userAPI- CartID---------")
        # print("vendorId- ", vendorId)
        # print("productId- ", productId)

        # MyModel.objects.filter(pk=some_value).update(field1='some value')

        user_Exist = addProduct.objects.filter(venId_id=vendorId, id=productId).exists()

        # print("userId_Exist", userId_Exist)

        if user_Exist:
            addProduct.objects.filter(venId_id=vendorId, id=productId).update(
                recycleBin=1
            )

            msg = {
                "msg": "Item-Deleted",
            }

        return JsonResponse(msg)



@api_view(["POST"])
def DuplicateProductByID_view(request, vendorId, productId):
    msg = {}

    if request.method == "POST":
        print("----------DuplicateProductByID_view --------")
        print("vendorId- ", vendorId)
        print("productId- ", productId)

        product_Exist = addProduct.objects.filter(
            venId_id=vendorId, id=productId
        ).exists()

        if product_Exist:

            try:

                query = addProduct.objects.filter(
                    venId_id=vendorId, id=productId
                ).values()

                namee = query[0]["name"] + " COPIED "
                mrpp = query[0]["mrp"]
                discountPercentt = query[0]["discountPercent"]
                productTypee = query[0]["productType"]
                Categoryy = query[0]["CategoryId_id"]
                subCategoryy = query[0]["subCategoryId_id"]
                taxStatuss = query[0]["taxStatus"]
                taxClasss = query[0]["taxClass"]
                shippingStatuss = query[0]["shippingStatus"]
                shippingAmountt = query[0]["shippingAmount"]
                totalUnitss = query[0]["totalUnits"]
                stockStatuss = query[0]["stockStatus"]
                trackQtyy = query[0]["trackQty"]
                productDescriptionn = query[0]["productDescription"]
                image_1 = query[0]["image1"]
                image_2 = query[0]["image2"]
                image_3 = query[0]["image3"]
                image_4 = query[0]["image4"]
                image_5 = query[0]["image5"]

                # print("category- " , Categoryy )
                # print("subCategoryy- " , subCategoryy )

                query = addProduct(
                    venId_id=vendorId,
                    name=namee,
                    mrp=mrpp,
                    discountPercent=discountPercentt,
                    productType=productTypee,
                    CategoryId_id=Categoryy,
                    subCategoryId_id=subCategoryy,
                    taxStatus=taxStatuss,
                    taxClass=taxClasss,
                    shippingStatus=shippingStatuss,
                    shippingAmount=shippingAmountt,
                    totalUnits=totalUnitss,
                    stockStatus=stockStatuss,
                    trackQty=trackQtyy,
                    productDescription=productDescriptionn,
                    image1=image_1,
                    image2=image_2,
                    image3=image_3,
                    image4=image_4,
                    image5=image_5,
                    date=datetime.today(),
                )

                query.save()

                msg = {"msg": "DuplicateProductAddedSuccessfully"}

                return JsonResponse(msg)

            except Exception as e:
                # print("------------------error on line no 404--------------")
                print("876 except - ", e)

                msg = {"msg": "Something Went Wrong"}

                return JsonResponse(msg)



@api_view(["DELETE"])
def PermanentDeleteProductByID_view(request, vendorId, productId):
    msg = {}

    if request.method == "DELETE":
        # print("----------Line no 1058 PermanentDeleteProductByID_view---------")
        # print("vendorId- " , vendorId)
        # print("productId- " , productId)

        # MyModel.objects.filter(pk=some_value).update(field1='some value')

        user_Exist = addProduct.objects.filter(venId_id=vendorId, id=productId).exists()

        # print("userId_Exist", userId_Exist)

        if user_Exist:
            # print("userId_Exist", user_Exist)

            delete_Query = addProduct.objects.filter(venId_id=vendorId, id=productId)
            # print(delete_Query)

            delete_Query.delete()

            msg = {
                "msg": "PermanentlyDeleted",
            }

        return JsonResponse(msg)


@api_view(["GET"])
def getPlacesOrders_view(request, vendorId):

    if request.method == "GET":

        getOrders_Exist = CartItem.objects.filter(
            productId__venId__id=vendorId, orderPlacedStatus=True
        ).exists()

        if getOrders_Exist:

            cartItemObject = CartItem.objects.filter(
                productId__venId__id=vendorId, orderPlacedStatus=True
            ).all()
            cartItemObjectSerializer = CartItemSerializer(cartItemObject, many=True)

            msg = {
                "status": 200,
                "msg": "orders Available ",
                "data": cartItemObjectSerializer.data,
            }

            return JsonResponse(msg)

        else:

            msg = {"status": 200, "msg": "Placed Orders Doesn't exist"}

            return JsonResponse(msg)


@api_view(["GET"])
def getAllCounting_view(request, vendorId):

    if request.method == "GET":

        vendorExist = vendorSignup.objects.filter(id=vendorId).exists()

        if vendorExist:

            countCategory = Category.objects.all().count()
            countSubCategory = SubCategory.objects.all().count()
            countTotalProducts = (
                addProduct.objects.filter(venId_id=vendorId).all().count()
            )
            countFeaturedProducts = (
                addProduct.objects.filter(venId_id=vendorId, setFeatured=True)
                .all()
                .count()
            )
            countRecycleBinProducts = (
                addProduct.objects.filter(venId_id=vendorId, recycleBin=True)
                .all()
                .count()
            )
            countTotalUnitsProducts = (
                addProduct.objects.filter(venId_id=vendorId, totalUnits__lte=10)
                .all()
                .count()
            )
            countPlacedOrders = CartItem.objects.filter(
                productId__venId__id=vendorId, orderPlacedStatus=True
            ).count()
            countTotalEarnings = CartItem.objects.filter(
                productId__venId__id=vendorId, orderPlacedStatus=True
            ).all()
            countTotalEarningsSerializer = CartItemSerializer(
                countTotalEarnings, many=True
            )

            earningsList = []

            for data in range(len(countTotalEarningsSerializer.data)):
                earningsList.append(
                    countTotalEarningsSerializer.data[data]["placeOrderId"][
                        "cartAmount"
                    ]
                )

            removeDuplicatedFromList = list(set(earningsList))
            totalEarningsSum = sum(removeDuplicatedFromList)
            earningInCommas = formatINR(totalEarningsSum)

            msg = {
                "status": 200,
                "getCountingData": {
                    "countCategory": countCategory,
                    "countSubCategory": countSubCategory,
                    "countTotalProducts": countTotalProducts,
                    "countFeaturedProducts": countFeaturedProducts,
                    "countRecycleBinProducts": countRecycleBinProducts,
                    "countTotalUnitsProducts": countTotalUnitsProducts,
                    "countPlacedOrders": countPlacedOrders,
                    "earningInCommas": earningInCommas,
                },
            }

            return JsonResponse(msg)

        else:
            return JsonResponse({"msg", "Vendor doesn't exist"})
