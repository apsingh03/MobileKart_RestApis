
from django.shortcuts import render
from django.http import HttpResponse , JsonResponse
from vendor.models import Category , SubCategory , Taxes , Shipping , vendorSignup , addProduct

from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.utils.html import strip_tags
from django.core import serializers
from datetime import datetime

import json
import jwt

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
  
  
class HelloView(APIView):
    permission_classes = (IsAuthenticated, )
  
    def get(self, request):
        content = {'message': 'Hello, GeeksforGeeks'}
        return Response(content)
    



# Create your views here.     

def vendor_Home(request):
    msg = {

       'PAGE' : "WELCOME TO VENDOR API PAGE",
       'GO back' : '/',

       'AddCategory_view' : [
           {'methods': 'POST , GET' , 
            'AddCategory_view': "/vendorApi/addcategory" }
       ], 

        'AddSubCategory_view' : [
           {'methods': 'POST , GET' , 
            'AddSubCategory_view': "/vendorApi/add-sub-category" }
       ], 

        'AddTax_view' : [
           {'methods': 'POST , GET' , 
            'AddTax_view': "/vendorApi/add-tax" }
       ], 

        'AddShipping_view' : [
           {'methods': 'POST , GET' , 
            'AddShipping_view': "/vendorApi/add-shipping" }
       ], 

       'get-subcat-bycategory/<str:pk>/' : [
           {'methods': 'GET' , 
            'GetSubCategoryByID_view': "/vendorApi/get-subcat-bycategory/Mobiles/" }
       ], 

        'Signup_view' : [
           {'methods': 'POST , GET'  , 
            'Signup_view': "/vendorApi/signup" }
       ], 

         'Login_view' : [
           {'methods': 'POST' , 
            'Login_view': "/vendorApi/vendorLogin" }
       ], 

        'addProduct_view' : [
           {'methods': 'POST , GET'  , 
            'addProduct_view': "/vendorApi/addproduct" }
       ], 

        'filter-productdetail-bySlug/<str:pk>/' : [
           {'methods': 'GET'  , 
            'FilterProductBySlug_view': "/vendorApi/filter-productdetail-bySlug/" }
       ], 


        'set-featuredProduct-byId/<str:pk>/' : [
           {'methods': 'PUT'  , 
            'SetFeaturedProductById_view': "/vendorApi/set-featuredProduct-byId/id/" }
       ], 

            'update-productdetail-byId/<str:pk>/' : [
           {'methods': 'PUT'  , 
            'UpdateProductByID_view': "/vendorApi/update-productdetail-byId/id/" }
       ], 


      'delete-product-byId/<str:pk1>/<str:pk2>/' : [
           {'methods': 'DELETE'  , 
            'DeleteProductByID_view': "/vendorApi/delete-product-byId/vendorID/ProductID/" }
       ], 


            'duplicate-product-byId/<str:pk1>/<str:pk2>/' : [
            {'methods': 'POST'  , 
            'DuplicateProductByID_view': "/vendorApi/duplicate-product-byId/vendorId/productId/" }
        ], 


          'permanent-delete-product-byId/<str:pk1>/<str:pk2>/' : [
            {'methods': 'DELETE'  , 
            'PermanentDeleteProductByID_view': "/vendorApi/permanent-delete-product-byId/vendorId/productId/" }
        ], 



    }

    return JsonResponse(msg)




@api_view(['POST', 'GET' ])
def AddCategory_view(request):
   
    msg = {}

    if request.method == "POST":
        # print("----------Line no 23 POST VendorAPI----------")
        # print(request)

        categoryName = strip_tags(request.data['cat_name'])
        # print(categoryName)
        exist_category = Category.objects.filter(cat_name = categoryName).exists()

        if not exist_category:
            query = Category(cat_name = categoryName )
            query.save()

            msg = {
            'msg' : "CategoryAdded",
            }
            return JsonResponse(msg)
        
        else :

            msg = {
            'msg' : "CategoryAlreadyExist",
            }
            return JsonResponse(msg)
        



    if request.method == "GET":
        # print("----------Line no 59 GET VendorAPI----------")

        # way using list 
        # getCategory = list(Category.objects.values())

        getCategory = Category.objects.values()
        data = getCategory[0]['cat_name']

        # js1 = json.dumps(getCategory.__dict__)
         
        # other way using serializers 
        # seriWaydata = serializers.serialize('json', Category.objects.all() )
        # print(getCategory)
        # return JsonResponse(seriWaydata , safe=False)

        msg = {
        'msg' : "CategoryGETREQUEST",
        'fetchCategory' : getCategory,
        }

        return Response(msg)


        


@api_view(['POST', 'GET' ])
def AddSubCategory_view(request):

    msg = {}

    if request.method == "POST":
        # print("----------Line no 107 POST VendorAPI----------")
        print(request)

        catIdd = strip_tags(request.data['catId'])
        cat_namee = strip_tags(request.data['cat_name'])
        sub_cat_namee = strip_tags(request.data['sub_cat_name'])

        # print(categoryName)
        exist_SubCategory = SubCategory.objects.filter(cat_name =  cat_namee, sub_cat_name = sub_cat_namee).exists()

        if not exist_SubCategory:
            query = SubCategory(catId_id = catIdd, cat_name = cat_namee , sub_cat_name	= sub_cat_namee )
            query.save()

            msg = {
            'msg' : "SubCategoryAdded",
            }
            return JsonResponse(msg)
        
        else :

            msg = {
            'msg' : "SubCategoryAlreadyExist",
            }
            return JsonResponse(msg)
        



    if request.method == "GET":
        # print("----------Line no 59 GET VendorAPI----------")

        # way using list 
        # getCategory = list(Category.objects.values())

        getCategory = SubCategory.objects.values()
        data = getCategory[0]['cat_name']

        # js1 = json.dumps(getCategory.__dict__)
         
        # other way using serializers 
        # seriWaydata = serializers.serialize('json', Category.objects.all() )
        # print(getCategory)
        # return JsonResponse(seriWaydata , safe=False)

        msg = {
        'msg' : "SubCategoryGETREQUEST",
        'fetchSubCategory' : getCategory,
        }

        return Response(msg)


    

@api_view(['POST', 'GET' ])
def AddTax_view(request):

    msg = {}

    if request.method == "POST":
        # print("----------Line no 167 POST VendorAPI----------")
        # print(request)

        tax_namee = strip_tags(request.data['tax_name'])
        tax_valuee = strip_tags(request.data['tax_value'])

        # print(categoryName)
        exist_SubCategory = Taxes.objects.filter(tax_name = tax_namee).exists()

        if not exist_SubCategory:
            query = Taxes(tax_name = tax_namee, tax_value = tax_valuee , date = datetime.today() )
            query.save()

            msg = {
            'msg' : "TaxClassAdded",
            }
            return JsonResponse(msg)
        
        else :

            msg = {
            'msg' : "TaxClassAlreadyExist",
            }
            return JsonResponse(msg)
        

    if request.method == "GET":
        # print("----------Line no 200 GET VendorAPI----------")

        getTaxes = Taxes.objects.values()

        msg = {
        'msg' : "TaxClassGETREQUEST",
        'TaxClass' : getTaxes,
        }

        return Response(msg)

 


@api_view(['POST', 'GET' ])
def AddShipping_view(request):

    msg = {}

    if request.method == "POST":
        # print("----------Line no 167 POST VendorAPI----------")
        # print(request)

        shipping_namee = strip_tags(request.data['shipping_state_name'])
        shipping_valuee = strip_tags(request.data['shipping_value'])

        # print(categoryName)
        exist_Shipping = Shipping.objects.filter(shipping_state_name = shipping_namee).exists()

        if not exist_Shipping:
            query = Shipping(shipping_state_name = shipping_namee, shipping_value = shipping_valuee , date = datetime.today() )
            query.save()

            msg = {
            'msg' : "ShippingStateNameAdded",
            }
            return JsonResponse(msg)
        
        else :

            msg = {
            'msg' : "ShippingStateNameAlreadyExist",
            }
            return JsonResponse(msg)
        

    if request.method == "GET":
        # print("----------Line no 200 GET VendorAPI----------")

        getShipping = Shipping.objects.values()

        msg = {
        'msg' : "ShippingClassGETREQUEST",
        'ShippingClass' : getShipping,
        }

        return Response(msg)




@api_view(['GET' ])
def GetSubCategoryByID_view(request , pk):

    msg = {}
      
    if request.method == "GET":
        # print("----------Line no 275 GET VendorAPI----------")
        # print("id- " , pk )

        getCategory = SubCategory.objects.filter(cat_name = pk).values()

        # print(getCategory)
        # data = getCategory[0]['cat_name']

        msg = {
        'msg' : "SubCategoryGETREQUEST",
        'fetchSubCategory' : getCategory,
        }

        return Response(msg)




@api_view(['POST', 'GET' ])
def Signup_view(request):

    msg = {}

    if request.method == "POST":
        # print("----------Line no 297 POST VendorAPI----------")
        

        fullname = strip_tags(request.data['fullname'])
        emailAddress = strip_tags(request.data['emailAddress'])
        passwords = strip_tags(request.data['passwords'])


        # print(categoryName)
        exist_email = vendorSignup.objects.filter(ven_email =  emailAddress  ).exists()

        if not exist_email:
            query =  vendorSignup( ven_name = fullname , ven_email =  emailAddress , ven_pass = passwords  , date = datetime.today() )
            query.save()

            msg = {
            'msg' : "VendorSignUpSuccessfull",
            }
            return JsonResponse(msg)
        
        else :

            msg = {
            'msg' : "EmailAlreadyExist",
            }
            return JsonResponse(msg)
        


    if request.method == "GET":

        print("----------Line no 343 GET VendorAPI----------")

        loginEmailId = strip_tags(request.data['loginEmailId'])
        loginPasswords = strip_tags(request.data['loginPasswords'])

        getSignup = vendorSignup.objects.filter( ven_email = loginEmailId  ).exists()
        # print(getSignup)

        if getSignup:

            fetchDetails = vendorSignup.objects.filter( ven_email = loginEmailId  ).values()

            fetchedId = fetchDetails[0]['ven_name']
            fetchedName = fetchDetails[0]['ven_name']
            fetchedEmail = fetchDetails[0]['ven_email']
            fetchedPass = fetchDetails[0]['ven_pass']
            fetchedIsLogged = fetchDetails[0]['ven_isLogged']
            fetchedDate = fetchDetails[0]['date']

            if fetchedPass == loginPasswords:
                
                msg = {
                'msg' : "VendorLoggedIn",
                'fetchDetails' : fetchDetails,
                }

                return Response(msg)

            else :

                msg = {
                'msg' : "Wrong Password",
                }

                return JsonResponse(msg)

        else :

            msg = {
                'msg' : "Incorrect Email Address",
                }

            return JsonResponse(msg)




@api_view(['POST' ])
def Login_view(request):

    msg = {}

    if request.method == "POST":

        # print("----------Line no 343 GET VendorAPI----------")

        loginEmailId = strip_tags(request.data['loginEmailId'])
        loginPasswords = strip_tags(request.data['loginPasswords'])

        getSignup = vendorSignup.objects.filter( ven_email = loginEmailId  ).exists()
        # print(getSignup)

        if getSignup:

            fetchDetails = vendorSignup.objects.filter( ven_email = loginEmailId  ).values()

            fetchedId = fetchDetails[0]['id']
            fetchedName = fetchDetails[0]['ven_name']
            fetchedEmail = fetchDetails[0]['ven_email']
            fetchedPass = fetchDetails[0]['ven_pass']
            fetchedIsLogged = fetchDetails[0]['ven_isLogged']
            fetchedDate = fetchDetails[0]['date']

            if fetchedPass == loginPasswords:
                
                payload_data = {
                    "fetchedId": fetchedId,
                    "fetchedName": fetchedName,
                    "fetchedEmail": fetchedEmail,
                    "fetchedIsLogged" : fetchedIsLogged,
                  
                    } 
                    
                my_secret = 'THISISMYSECRETKEYTOPROTECTDATA'
                    
                token = jwt.encode( payload=payload_data, key=my_secret,  algorithm = 'HS256' )

                # print(token)

                msg = {
                'msg' : "VendorLoggedIn",
                'token' : token,
                }

                return Response(msg)

            else :

                msg = {
                'msg' : "Wrong Password",
                }

                return JsonResponse(msg)

        else :

            msg = {
                'msg' : "Incorrect Email Address",
                }

            return JsonResponse(msg)





@api_view(['POST' , 'GET'])
def addProduct_view(request):

    msg = {}

    if request.method == "POST":

        vendorIdd = strip_tags(request.data['vendorId'])
        productNamee = strip_tags(request.data['productNamee'])
        productMrpp = strip_tags(request.data['productMrpp'])
        productDiscountt = strip_tags(request.data['productDiscountt'])
        productTypee = strip_tags(request.data['productTypee'])
        productCategoryy = strip_tags(request.data['productCategoryy'])
        productSubCategoryDataa = strip_tags(request.data['productSubCategoryDataa'])
        productTaxTypee = strip_tags(request.data['productTaxTypee'])
        productTaxClassDataa = strip_tags(request.data['productTaxClassDataa'])
        productShippingStatuss = strip_tags(request.data['productShippingStatuss'])
        productFaree = strip_tags(request.data['productFaree'])
        productUnitss = strip_tags(request.data['productUnitss'])
        productStockStatuss = strip_tags(request.data['productStockStatuss'])
        productTrackQtyy = strip_tags(request.data['productTrackQtyy'])
        productImageLink1 = strip_tags(request.data['productImageLink11'])
        productImageLink2 = strip_tags(request.data['productImageLink22'])
        productImageLink3 = strip_tags(request.data['productImageLink33'])
        productImageLink4 = strip_tags(request.data['productImageLink44'])
        productImageLink5 = strip_tags(request.data['productImageLink55'])
        productDescriptionn = strip_tags(request.data['productDescriptionn'])

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

        try:
            query = addProduct( venId_id = vendorIdd , name = productNamee ,  mrp = productMrpp, discountPercent = productDiscountt , 
                            
                            productType = productTypee , Category = productCategoryy , subCategory = productSubCategoryDataa , 

                            taxStatus = productTaxTypee , taxClass = productTaxClassDataa , shippingStatus = productShippingStatuss ,

                            shippingAmount = productFaree , totalUnits = productUnitss , stockStatus = productStockStatuss , trackQty = productTrackQtyy ,

                            productDescription = productDescriptionn , image1 = productImageLink1 , image2 = productImageLink2 , 

                            image3 = productImageLink3 , image4 = productImageLink4 , image5 = productImageLink5 , 

                            date = datetime.today()

                                )
            
            query.save()

            msg = {'msg' : 'ProductAddedSuccessfully'}

            return JsonResponse(msg)


        except Exception as e:

            print("------------------error on line no 404--------------")
            print(e)

            msg = {'msg' : 'Error on Line 596'}

            return JsonResponse(msg)


         

    if request.method == "GET":

        getAllProducts = addProduct.objects.values()
        
        msg = {'msg' : 'addProductGETRequest',
               'getAllProducts' : getAllProducts
               }
        
        return Response(msg)



@api_view(["GET"])
def FilterProductBySlug_view(request, pk):

    msg = {}

    if request.method == "GET":

        # print("----------Line no 275 GET VendorAPI----------")
        # print("pk- ", pk)

        extractPk = pk.split("-")

        # print("extractPk- ", extractPk )

      

        filterByCategory = extractPk[0]

        catExistQuery = addProduct.objects.filter(Category=filterByCategory).exists()
        
        if catExistQuery:
                
                #  MEANS CATEGORY 
                #  http://localhost:3000/productall/Mobiles/

                if len(extractPk) == 1:

                    # print("-----------1")
                    # filter by Category

                    getProduct = addProduct.objects.filter(
                        Category=filterByCategory
                    ).values()

                    msg = {
                        "msg": "FilterProductGETREQUEST",
                        "fetchProduct": getProduct,
                    }

                    return Response(msg)
                
                else :

                    # means 2 slug 

                    filterBySubCategory = extractPk[1]
                    subCatExistQuery = addProduct.objects.filter( subCategory=filterBySubCategory ).exists()

                    if subCatExistQuery:

                        
                        #  MEANS CATEGORY AND SUBCATEGORY
                        #  http://localhost:3000/productall/Mobiles/Samsung/

                        if len(extractPk) == 2:

                            # print("-----------2")
                            # filter by sub cat

                            getProduct = addProduct.objects.filter(
                                subCategory=filterBySubCategory
                            ).values()

                            msg = {
                                "msg": "FilterProductGETREQUEST",
                                "fetchProduct": getProduct,
                            }

                            return Response(msg)



                        #  MEANS CATEGORY , SUBCATEGORY , id , name 
                        #  http://localhost:3000/productall/Mobiles/Samsung/id/name

                        if len(extractPk) == 3:

                            # print("-----------3")
                            # filter by id
                            #
                            filterById = extractPk[2]

                            getProduct = addProduct.objects.filter(id=filterById).values()

                            msg = {
                                "msg": "FilterProductGETREQUEST",
                                "fetchProduct": getProduct,
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




@api_view(['PUT' ])
def SetFeaturedProductById_view(request , pk1, pk2):

    msg = {}
      
    if request.method == "PUT":
        # print("----------Line no 275 GET VendorAPI----------")
        print("id- " , pk1  , pk2)

        # getCategory = addProduct.objects.filter(id = pk1).values()
        query = addProduct.objects.filter(id = pk1).exists()

        if query:


            if pk2 == "notFeatured":

                queryGet = addProduct.objects.get( id = pk1 )
                queryGet.setFeatured = 1
                queryGet.save()

                msg = {
                'status' : 200,
                'msg' : "ProductSetAsFeatured"
                }

                return JsonResponse(msg)
            
            if pk2 == "itsFeatured":

                queryGet = addProduct.objects.get( id = pk1 )
                queryGet.setFeatured = 0
                queryGet.save()

                msg = {
                'status' : 200,
                'msg' : "RemovedFromFeatured"
                }

                return JsonResponse(msg)





@api_view(['PUT' ])
def UpdateProductByID_view(request , pk):

    msg = {}
      
    if request.method == "PUT":
        # print("----------Line no 807 put VendorAPI----------")
       

        vendorIdd = strip_tags(request.data['vendorId'])
        productNamee = strip_tags(request.data['productNamee'])
        productMrpp = strip_tags(request.data['productMrpp'])
        productDiscountt = strip_tags(request.data['productDiscountt'])
        productTypee = strip_tags(request.data['productTypee'])
        productCategoryy = strip_tags(request.data['productCategoryy'])
        productSubCategoryDataa = strip_tags(request.data['productSubCategoryDataa'])
        productTaxTypee = strip_tags(request.data['productTaxTypee'])
        productTaxClassDataa = strip_tags(request.data['productTaxClassDataa'])
        productShippingStatuss = strip_tags(request.data['productShippingStatuss'])
        productFaree = strip_tags(request.data['productFaree'])
        productUnitss = strip_tags(request.data['productUnitss'])
        productStockStatuss = strip_tags(request.data['productStockStatuss'])
        productTrackQtyy = strip_tags(request.data['productTrackQtyy'])
        productImageLink1 = strip_tags(request.data['productImageLink11'])
        productImageLink2 = strip_tags(request.data['productImageLink22'])
        productImageLink3 = strip_tags(request.data['productImageLink33'])
        productImageLink4 = strip_tags(request.data['productImageLink44'])
        productImageLink5 = strip_tags(request.data['productImageLink55'])
        productDescriptionn = strip_tags(request.data['productDescriptionn'])

        # print("-----------------------------------------------------")

        # print("product id- " , pk )
        # print("vendorIdd-> " , vendorIdd )
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

    
        
        try:
            queryybn = addProduct.objects.filter(id = pk).update( venId_id = vendorIdd , name = productNamee ,  mrp = productMrpp, discountPercent = productDiscountt , 
                            
                            productType = productTypee , Category = productCategoryy , subCategory = productSubCategoryDataa , 

                            taxStatus = productTaxTypee , taxClass = productTaxClassDataa , shippingStatus = productShippingStatuss ,

                            shippingAmount = productFaree , totalUnits = productUnitss , stockStatus = productStockStatuss , trackQty = productTrackQtyy ,

                            productDescription = productDescriptionn , image1 = productImageLink1 , image2 = productImageLink2 , 

                            image3 = productImageLink3 , image4 = productImageLink4 , image5 = productImageLink5 , 

                            date = datetime.today() )
            

            msg = {'msg' : 'ProductUpdatedSuccessfully'}

            return JsonResponse(msg)


        except Exception as e:

            # print("------------------error on line no 886--------------")
            # print(e)

            msg = {'msg' : 'Error on Line 886'}

            return JsonResponse(msg)



          
# pk is user id / pk2 is product ID
@api_view(['DELETE'])
def DeleteProductByID_view(request, pk1, pk2 ):
    
    msg = {}

    if request.method == "DELETE":

        # print("----------Line no 257 POST userAPI- CartID---------")
        # print("pk1- " , pk1)
        # print("pk2- " , pk2)

        # MyModel.objects.filter(pk=some_value).update(field1='some value')
        
        user_Exist = addProduct.objects.filter( venId_id = pk1, id  =  pk2  ).exists()

        # print("userId_Exist", userId_Exist)

        if  user_Exist:

            addProduct.objects.filter( venId_id = pk1,  id  =  pk2  ).update(recycleBin = 1)

            msg = {
                'msg' : "Item-Deleted",
            }


        return JsonResponse( msg )        




# pk is vendor id / pk2 is product  ID
@api_view(['POST'])
def DuplicateProductByID_view(request, pk1, pk2 ):
    
    msg = {}

    if request.method == "POST":

        # print("----------Line no 257 POST userAPI- CartID---------")
        # print("pk1- " , pk1)
        # print("pk2- " , pk2)

     
        
        product_Exist = addProduct.objects.filter( venId_id = pk1, id  =  pk2  ).exists()


        if  product_Exist:

            # print("it exist ")

            query = addProduct.objects.filter( venId_id = pk1, id  =  pk2  ).values()

            namee = query[0]["name"]+" COPIED "
            mrpp =  query[0]["mrp"] 
            discountPercentt =  query[0]["discountPercent"] 
            productTypee =  query[0]["productType"]  
            Categoryy =  query[0]["Category"]  
            subCategoryy =  query[0]["subCategory"]  
            taxStatuss =  query[0]["taxStatus"] 
            taxClasss =  query[0]["taxClass"]  
            shippingStatuss =  query[0]["shippingStatus"]  
            shippingAmountt =  query[0]["shippingAmount"]  
            totalUnitss =  query[0]["totalUnits"]  
            stockStatuss =  query[0]["stockStatus"]  
            trackQtyy =  query[0]["trackQty"]  
            productDescriptionn =  query[0]["productDescription"]  
            image_1 =  query[0]["image1"]  
            image_2 =  query[0]["image2"] 
            image_3 =  query[0]["image3"]  
            image_4 =  query[0]["image4"]  
            image_5 =  query[0]["image5"]  

            try:
                query = addProduct( venId_id = pk1 , name = namee ,  mrp = mrpp, discountPercent = discountPercentt , 
                            
                            productType = productTypee , Category = Categoryy , subCategory = subCategoryy , 

                            taxStatus = taxStatuss , taxClass = taxClasss , shippingStatus = shippingStatuss ,

                            shippingAmount = shippingAmountt , totalUnits = totalUnitss , stockStatus = stockStatuss , trackQty = trackQtyy ,

                            productDescription = productDescriptionn , image1 = image_1 , image2 = image_2 , 

                            image3 = image_3 , image4 = image_4 , image5 = image_5 , 

                            date = datetime.today()

                                )
            
                query.save()

                msg = {'msg' : 'DuplicateProductAddedSuccessfully'}

                return JsonResponse(msg)


            except Exception as e:

                # print("------------------error on line no 404--------------")
                # print(e)

                msg = {'msg' : 'Error on Line 596'}

                return JsonResponse(msg)
               
        
        

# pk is user id / pk2 is product ID
@api_view(['DELETE'])
def PermanentDeleteProductByID_view(request, pk1, pk2 ):
    
    msg = {}

    if request.method == "DELETE":

        print("----------Line no 1058 PermanentDeleteProductByID_view---------")
        print("vendorId- " , pk1)
        print("productId- " , pk2)

        # MyModel.objects.filter(pk=some_value).update(field1='some value')
        
        user_Exist = addProduct.objects.filter( venId_id = pk1, id  =  pk2  ).exists()

        # print("userId_Exist", userId_Exist)

        if  user_Exist:

            print("userId_Exist", user_Exist)

            delete_Query = addProduct.objects.filter( venId_id = pk1, id  =  pk2  )
            print(delete_Query)
            
            delete_Query.delete()

            msg = {
                'msg' : "PermanentlyDeleted",
            }


        return JsonResponse( msg )        
