from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from rest_framework.decorators import api_view, permission_classes
from django.utils.html import strip_tags
from userApi.models import *
from datetime import datetime
from rest_framework.response import Response
from vendor.models import *
from django.core import serializers
import json
from random import randint, randrange
import jwt


# Create your views here.
def user_Home(request):

    links = {
        "msg": "Welcome to USERS API ",
        "demo": {
            "methods": "POST, GET",
            "demo": "/userApi/demo",
        },
        "signup": {
            "methods": "POST, GET",
            "user_Signup_view": "/userApi/signup",
        },
        "addIn-cart": {
            "methods": "POST",
            "user_addInCart_view": "/userApi/addIn-cart",
        },
        "fetch-cart-byUserId/<str:pk>/": {
            "methods": "GET",
            "user_fetchCartByUserId_view": "/userApi/fetch-cart-byUserId/<str:pk>/'",
        },
        "update-cartqty-byproductid/<str:pk1>/<str:pk2>/": {
            "methods": "PUT",
            "user_updateCartQtyByProductID_view": "/userApi/update-cartqty-byproductid/<str:pk1>/<str:pk2>/",
        },
        "delete-cartItem/<str:pk1>/<str:pk2>/": {
            "methods": "DELETE",
            "user_deleteCartItem_view": "/userApi/delete-cartItem/<str:pk1>/<str:pk2>/",
        },
        "add-address/<str:pk>/": {
            "methods": "POST, GET",
            "user_address_view": "/userApi/add-address/<str:pk>/",
        },
        "userLogin": {
            "methods": "POST",
            "user_Login_view": "/userApi/userLogin/",
        },
        "placeOrder/": {
            "methods": "POST , GET",
            "user_PlaceOrder_view": "/userApi/placeOrder/",
        },
    }

    return JsonResponse(links)


@api_view(["POST", "GET"])
def demo(request):

    print("demo user api page ")
    return JsonResponse({"name": "ajay", "api": "user api section "})


@api_view(["POST"])
def user_Signup_view(request):
    msg = {}

    # print("------- Process initiated ----------"  )

    if request.method == "POST":

        # print("---86---- Post request ----------"  )

        user_Fname = strip_tags(request.data["firstName"])
        user_Lname = strip_tags(request.data["LastName"])
        user_Email = strip_tags(request.data["Eemail"])
        user_password = strip_tags(request.data["Ppassword"])

        userExisttt = UserSignUp.objects.filter(u_email=user_Email).exists()
        # print("-----------" , userExisttt)

        if not userExisttt:

            query = UserSignUp(
                u_fname=user_Fname,
                u_lname=user_Lname,
                u_email=user_Email,
                u_password=user_password,
            )
            query.save()

            message = {"msg": "userSignUpSuccessfull"}

            return JsonResponse(message)

        else:
            print("--else ---------", user_Email)

            message = {"msg": "userAlreadyExist"}

        return JsonResponse(message)


@api_view(["POST"])
def user_addInCart_view(request):

    msg = {}

    if request.method == "POST":

        # print("----------Line no 90 POST userAPI- ADD IN CART---------")

        productIdd = strip_tags(request.data["productId"])
        userId = strip_tags(request.data["userId"])

        # print("productIdd- "  , productIdd  )
        # print("userId- "  , userId  )

        # print(categoryName)
        userId_Exist = Cart.objects.filter(userId_id=userId).exists()

        if userId_Exist:
            # print("userId_Exist ")

            productId_Exist = Cart.objects.filter(
                userId_id=userId, productId=productIdd
            ).exists()

            # print("hsdf---" ,  productId_Exist )

            if not productId_Exist:

                # print(" 166 already exist")

                query = Cart(
                    userId_id=userId,
                    productId_id=productIdd,
                    qty=1,
                    date=datetime.now(),
                )
                query.save()

                msg = {
                    "msg": "ProductAddedInCart",
                }

                return JsonResponse(msg)

            else:

                msg = {
                    "msg": "Product Already Exist",
                }

                return JsonResponse(msg)

        else:
            # working
            print("else userId_Exist  ")

            query = Cart(
                userId_id=userId, productId_id=productIdd, qty=1, date=datetime.now()
            )
            query.save()

            msg = {
                "msg": "ProductAddedInCart",
            }

            return JsonResponse(msg)

    return JsonResponse({"msg": "Null"})


@api_view(["GET"])
def user_fetchCartByUserId_view(request, userId):

    msg = {}

    if request.method == "GET":

        # print("----------Line no 90 POST userAPI- CartID---------")
        # print("userId- " , userId)

        userId_Exist = Cart.objects.filter(userId_id=userId).exists()

        # print("userId_Exist", userId_Exist)

        if userId_Exist:

            getCart = Cart.objects.filter(userId_id=userId).values()

            # print("-------148----------foreign key relationships -------------------------")

            # my_obj = Cart.objects.all().prefetch_related('products') # error
            # my_obj = Cart.objects.get(id =  1).prefetch_related('products')

            # my_obj = Cart.objects.prefetch_related('addProduct')
            # hello = my_obj.relateds

            # venue = Cart.objects.filter(id=1)
            # print("----- 149- " , my_obj )

            # print("-----156-------------------------------------")

            dataArray = []

            for i in range(len(getCart)):

                dataArray.append(getCart[i])

                # print( "productId_id - ",  dataArray[i]['productId_id']  )

                users = UserSignUp.objects.filter(id=dataArray[i]["userId_id"]).values()
                convertedUsers = list(users)

                # this is working
                # dataArray[i]['userId_id'] = []
                # dataArray[i]['userId_id'].append(convertedUsers)
                dataArray[i].__setitem__("userKey", convertedUsers)

                # this isn't working instead og this we r using line no 186
                # dataArray[i]['productId_id'] = []
                # dataArray[i]['productId_id'].append(convertedProduct)

                product = addProduct.objects.filter(
                    id=dataArray[i]["productId_id"]
                ).values()
                convertedProduct = list(product)
                # print("174 - convertedUsers- ", convertedProduct )

                dataArray[i].__setitem__("productKey", convertedProduct)
                # dataArray[i]["fsadfasdfas"] = convertedProduct

            # print("\n")
            # print("\n")

            # for i in range( len(getCart) ):
            #     print("212--> " , type( getCart[i] ) )
            #     print("213- " , getCart[i]['product'] )
            #     print("\n")

            msg = {"msg": "ProductAddedInCart", "cartFullArray": dataArray}

            return Response(msg)

        else:

            msg = {
                "msg": "Cart is Empty",
            }

            return JsonResponse(msg)


@api_view(["PUT"])
def user_updateCartQtyByProductID_view(request, cartId, qtyMessage):

    msg = {}

    if request.method == "PUT":

        # print("----------Line no 257 POST userAPI- CartID---------")
        # print("pk- " , cartId)
        # print("pk2- " , qtyMessage)

        # MyModel.objects.filter(pk=some_value).update(field1='some value')

        productId_Exist = Cart.objects.filter(id=cartId).exists()

        # print("userId_Exist", userId_Exist)

        if productId_Exist:

            if qtyMessage == "incremented":

                # updateQuery = Cart.objects.filter(id = pk  ).update(qty = pk)
                queryGet = Cart.objects.get(id=cartId)
                # print("queryGet- " , queryGet )
                queryGet.qty += 1
                queryGet.save()

                msg = {
                    "msg": "CartQtyIncremented",
                }

                return Response(msg)

            if qtyMessage == "decremented":

                queryGet = Cart.objects.get(id=cartId)
                queryGet.qty -= 1

                if queryGet.qty < 1:
                    queryGet.qty = 1

                queryGet.save()

                msg = {
                    "msg": "CartQtyDecremented",
                }

                return Response(msg)

    return JsonResponse({"msg": "Null"})


# pk is user id / pk2 is cartItem ID
@api_view(["DELETE"])
def user_deleteCartItem_view(request, userId, cartId):

    msg = {}

    if request.method == "DELETE":

        # print("----------Line no 257 POST userAPI- CartID---------")
        # print("pk1- " , pk1)
        # print("pk2- " , pk2)

        # MyModel.objects.filter(pk=some_value).update(field1='some value')

        user_Exist = Cart.objects.filter(userId_id=userId).exists()

        # print("userId_Exist", userId_Exist)

        if user_Exist:

            item_Exist = Cart.objects.filter(id=cartId).exists()

            if item_Exist:

                query = Cart.objects.get(id=cartId)
                query.delete()

                msg = {
                    "msg": "CartItemDeleted",
                }

                return Response(msg)

            else:

                msg = {
                    "msg": "FailedItemDeleted",
                }

                return Response(msg)

    return JsonResponse({"msg": "Null"})


@api_view(["POST", "GET"])
def user_address_view(request, userId):

    msg = {}

    # print("------- Process initiated ----------"  )

    if request.method == "POST":

        # print("------- Post request ----------"  )

        # print (   request.data['firstName']  )

        # user_Fname = strip_tags(request.data['firstName'])
        # user_Lname = strip_tags(request.data['LastName'])
        # user_Email = strip_tags(request.data['Eemail'])
        # user_password = strip_tags(request.data['Ppassword'])

        # query = Address(userId_id = 60 , fullAddress = "" , landmark = "user_Email", city = "user_password" , state = "" , date = datetime.today()  )
        # query.save()

        message = {"msg": "AddressAdd post "}

        return JsonResponse(message)

    if request.method == "GET":

        # print("------- GET request ----------"  )

        getQuery = Address.objects.filter(userId_id=userId).values()

        dataArray = []

        for i in range(len(getQuery)):
            dataArray.append(getQuery[i])

            users = UserSignUp.objects.filter(id=dataArray[i]["userId_id"]).values()
            convertedUsers = list(users)

            dataArray[i].__setitem__("userKey", convertedUsers)

        message = {
            "msg": "getRequest",
            "dataArray": dataArray,
        }

        # print("dataArray-  "  , dataArray )

        return Response(message)

    return JsonResponse(message)


@api_view(["POST"])
def user_Login_view(request):

    msg = {}

    if request.method == "POST":

        # print("----------Line no 343 GET VendorAPI----------")

        loginEmailId = strip_tags(request.data["loginEmailId"])
        loginPasswords = strip_tags(request.data["loginPasswords"])

        getSignup = UserSignUp.objects.filter(u_email=loginEmailId).exists()
        # print(getSignup)

        if getSignup:

            fetchDetails = UserSignUp.objects.filter(u_email=loginEmailId).values()

            fetchedId = fetchDetails[0]["id"]
            fetchedFName = fetchDetails[0]["u_fname"]
            fetchedLName = fetchDetails[0]["u_lname"]
            fetchedEmail = fetchDetails[0]["u_email"]
            fetchedPassword = fetchDetails[0]["u_password"]

            if fetchedPassword == loginPasswords:

                payload_data = {
                    "fetchedId": fetchedId,
                    "fetchedFName": fetchedFName,
                    "fetchedLName": fetchedLName,
                    "fetchedEmail": fetchedEmail,
                }

                my_secret = "THISISMYSECRETKEYTOPROTECTDATA"

                token = jwt.encode(
                    payload=payload_data, key=my_secret, algorithm="HS256"
                )

                # print("user Login token - " , token)

                msg = {
                    "status": 200,
                    "msg": "UserLoggedIn",
                    "token": token,
                }

                return JsonResponse(msg)

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
def user_PlaceOrder_view(request):

    msg = {}

    if request.method == "POST":

        # tasks to do with cartids
        # 1 - minus  qty from product stock
        # 2 - set true in cart table orderPlacedStatus to true

        addressId = strip_tags(request.data["addressId"])
        userId = strip_tags(request.data["userId"])
        cartIds = strip_tags(request.data["cartIdList"])
        checkoutAmount = strip_tags(request.data["checkoutAmount"])

        randomTrackNo = randint(1000, 10000)

        # print("GET- " , type( cartIds )  , cartIds )

        convertStringToList = list(cartIds)

        # print("convertStringToList- " , type( convertStringToList )  , convertStringToList )

        # dump = json.dumps( cartIds )

        # print("convertStringTodump- " , type( dump )  , dump )

        # print("convertStringTo index- " ,  dump[1] )

        # print( "split - " , cartIds.split("}") )

        # print( "find - " , cartIds.find("cartId") )

        # seriWaydata = serializers.serialize('json', dump )

        query = PlaceOrder(
            userId_id=userId,
            addressId_id=addressId,
            productsArray=cartIds,
            cartAmount=(checkoutAmount),
            paymentId=0,
            paymentMode="COD",
            trackingNo=randomTrackNo,
            status=0,
            date=datetime.today(),
        )

        query.save()

        msg = {"status": 200, "msg": "its working"}

        return JsonResponse(msg)

    if request.method == "GET":

        # print("GET dsfsadfasdfasdfasfa")

        getOrders = PlaceOrder.objects.values()

        msg = {"status": 200, "getPlacedOrdersList": getOrders}

        return Response(msg)
