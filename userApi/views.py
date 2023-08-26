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
from userApi.serializers import *

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


def getCurrentDate():
    format_datetime = datetime.today()
    return format_datetime.strftime("%b %d %Y %H:%M:%S")


@api_view(["POST", "GET"])
def demo(request):
    print("demo user api page ")
    return JsonResponse({"name": "ajay", "api": "user api section "})


# getCurrentDate()



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
                date=getCurrentDate(),
            )
            query.save()

            message = {"status": 200, "msg": "userSignUpSuccessfull"}

            return JsonResponse(message)

        else:
            # print("--else ---------", user_Email)

            message = {"status": 200, "msg": "userAlreadyExist"}

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



@api_view(["POST"])
def user_addInCart_view(request):
    msg = {}

    if request.method == "POST":
        print("----------Line no 90 POST userAPI- ADD IN CART---------")

        productIdd = strip_tags(request.data["productId"])
        userIdd = strip_tags(request.data["userId"])

        # print("productIdd- "  , productIdd  )
        print("userId- ", userIdd)

        placeOrder_Exist = PlaceOrder.objects.filter(
            userId=userIdd, status=False
        ).exists()

        if not placeOrder_Exist:

            # print("place Order not exist create it ")

            PlaceOrder.objects.create(userId_id=userIdd, date=getCurrentDate())

            queryPlaceOrder = PlaceOrder.objects.get(userId=userIdd, status=False)

            # print(queryPlaceOrder.id)

            CartItem.objects.create(
                userId_id=userIdd,
                productId_id=productIdd,
                placeOrderId_id=queryPlaceOrder.id,
                qty=1,
                date=getCurrentDate(),
            )

            msg = {
                "status": 200,
                "msg": "ProductAddedInCart",
            }

            return JsonResponse(msg)

        else:

            # print("ELSE CASE running ")

            queryPlaceOrder = PlaceOrder.objects.get(userId=userIdd, status=False)

            # print(queryPlaceOrder.id)

            CartItem_Exist = CartItem.objects.filter(
                userId_id=userIdd, productId=productIdd, orderPlacedStatus=False
            ).exists()

            if not CartItem_Exist:

                CartItem.objects.create(
                    userId_id=userIdd,
                    productId_id=productIdd,
                    placeOrderId_id=queryPlaceOrder.id,
                    qty=1,
                    date=getCurrentDate(),
                )

                msg = {
                    "status": 200,
                    "msg": "ProductAddedInCart",
                }

                return JsonResponse(msg)

            else:

                msg = {
                    "status": 200,
                    "msg": "Product Already Exist",
                }

                return JsonResponse(msg)



@api_view(["GET"])
def user_fetchCartByUserId_view(request, userId):
    msg = {}

    if request.method == "GET":
        # print("----------Line no 90 POST userAPI- CartID---------")
        # print("userId- " , userId)

        userId_Exist = CartItem.objects.filter(
            userId__id=userId, orderPlacedStatus=False
        ).exists()

        if userId_Exist:

            userObject = CartItem.objects.filter(
                userId__id=userId, orderPlacedStatus=False
            ).all()
            userObjectSerializer = CartItemSerializer(userObject, many=True)

            msg = {
                "status": 200,
                "msg": "Cart data Available",
                "cartFullArray": userObjectSerializer.data,
            }

            return Response(msg)

        else:
            msg = {
                "status": 200,
                "msg": "Cart is Empty",
            }

            return JsonResponse(msg)



@api_view(["PUT"])
def user_updateCartQtyByProductID_view(request, cartId, qtyMessage):
    msg = {}

    if request.method == "PUT":

        productId_Exist = CartItem.objects.filter(id=cartId).exists()

        # print("userId_Exist", userId_Exist)

        if productId_Exist:
            if qtyMessage == "incremented":
                # updateQuery = Cart.objects.filter(id = pk  ).update(qty = pk)
                queryGet = CartItem.objects.get(id=cartId)
                # print("queryGet- " , queryGet )
                queryGet.qty += 1
                queryGet.save()

                msg = {
                    "msg": "CartQtyIncremented",
                }

                return Response(msg)

            if qtyMessage == "decremented":
                queryGet = CartItem.objects.get(id=cartId)
                queryGet.qty -= 1

                if queryGet.qty < 1:
                    queryGet.qty = 1

                queryGet.save()

                msg = {
                    "msg": "CartQtyDecremented",
                }

                return Response(msg)

    return JsonResponse({"msg": "Null"})



@api_view(["DELETE"])
def user_deleteCartItem_view(request, userId, cartId):
    msg = {}

    if request.method == "DELETE":

        try:

            queryPlaceOrder = PlaceOrder.objects.get(userId=userId, status=False)

            user_Exist = CartItem.objects.filter(
                userId_id=userId, placeOrderId_id=queryPlaceOrder.id
            ).exists()

            # print("userId_Exist", userId_Exist)

            if user_Exist:
                item_Exist = CartItem.objects.filter(id=cartId).exists()

                if item_Exist:

                    query = CartItem.objects.get(id=cartId)

                    print(query)

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
        except Exception as e:
            errorMsg = "Error is - " + str(e)

            return JsonResponse({"msg": errorMsg})


@api_view(["POST", "GET"])
def user_address_view(request, userId):
    msg = {}

    if request.method == "POST":
        # print("------- Post request ----------")

        receiverNamee = strip_tags(request.data["receiverName"])
        fullAddresss = strip_tags(request.data["fullAddress"])
        landmarkk = strip_tags(request.data["landmark"])
        cityy = strip_tags(request.data["city"])
        statee = strip_tags(request.data["state"])

        query = Address(
            userId_id=userId,
            reciverName=receiverNamee,
            fullAddress=fullAddresss,
            landmark=landmarkk,
            city=cityy,
            state=statee,
            date=getCurrentDate(),
        )
        query.save()

        message = {"status": 200, "msg": "Address Added Successfully"}

        return JsonResponse(message)

    if request.method == "GET":
        # print("------- GET request ----------"  )

        getQuery = Address.objects.filter(userId_id=userId).all()

        getQuerySerializer = AddressSerializer(getQuery, many=True)

        message = {
            "status": 200,
            "msg": "addressGetRequest",
            "dataArray": getQuerySerializer.data,
        }

        return Response(message)


@api_view(["PUT", "GET"])
def user_PlaceOrder_view(request, userId):
    msg = {}

    if request.method == "PUT":

        # tasks to do with cartids
        # 1 - minus  qty from product stock
        # 2 - set true in cart table orderPlacedStatus to true

        try:

            # print("-------------------------- user_PlaceOrder_view ----------------------  ")
            # print("userId - " , userId )

            addressId = strip_tags(request.data["addressId"])
            checkoutAmount = strip_tags(request.data["checkoutAmount"])

            randomTrackNo = randint(1000, 10000)

            # find PlaceOrderID by userId
            queryFindId = PlaceOrder.objects.get(userId_id=userId, status=False)
            # print( "placeOrderId - " ,  queryFindId.id )

            CartItem.objects.filter(placeOrderId_id=queryFindId.id).all().update(
                orderPlacedStatus=1
            )

            # Detuct Cart Qty from products qty
            queryCartItem = CartItem.objects.filter(
                placeOrderId_id=queryFindId.id, orderPlacedStatus=False
            ).values()

            for data in range(len(queryCartItem)):

                productId = queryCartItem[data]["productId_id"]
                productQty = queryCartItem[data]["qty"]
                productGetQuery = addProduct.objects.get(id=productId)

                if productGetQuery.totalUnits > 0:
                    productGetQuery.totalUnits -= productQty
                    productGetQuery.save()

            PlaceOrder.objects.filter(userId_id=userId, status=False).update(
                addressId_id=addressId,
                cartAmount=checkoutAmount,
                paymentId=0,
                paymentMode="COD",
                trackingNo=randomTrackNo,
                status=1,
                date=getCurrentDate(),
            )

            msg = {"status": 200, "msg": "its working"}

            return JsonResponse(msg)

        except Exception as e:

            errorMsg = "Error is - " + str(e)

            msg = {"status": 200, "msg": e}

            return JsonResponse(msg)

    if request.method == "GET":

        getOrders_Exist = PlaceOrder.objects.filter(
            userId_id=userId, status=True
        ).exists()

        if getOrders_Exist:

            # print("Yes exist ")

            getPlaceOrderQuery = PlaceOrder.objects.filter(
                userId_id=userId, status=True
            ).values()

            # print(getPlaceOrderQuery)

            addCartI = []

            for data in range(len(getPlaceOrderQuery)):

                # print(  "place Order ID - " ,  getPlaceOrderQuery[data]['id'] )

                cartItemObject = CartItem.objects.filter(
                    placeOrderId_id=getPlaceOrderQuery[data]["id"],
                    orderPlacedStatus=True,
                )
                cartItemObjectSerializer = CartItemSerializer(cartItemObject, many=True)

                addCartI.append(cartItemObjectSerializer.data)

            msg = {"status": 200, "getCartData": addCartI}

            return JsonResponse(msg)



@api_view(["POST", "GET", "DELETE"])
def user_addToWishlist_view(request, userId, productId):

    if request.method == "POST":

        wishListQuery = WishList.objects.filter(
            userId_id=userId, productId_id=productId
        ).exists()
        # print(wishListQuery)
        if not wishListQuery:
            # print("ITS POST IT ")

            WishList.objects.create(
                userId_id=userId, productId_id=productId, date=getCurrentDate()
            )
            # print("ADDED")
            return JsonResponse({"status": 200, "msg": "addedInWishlist"})

        return JsonResponse({"msg": "WishListPostRequest"})

    if request.method == "GET":

        # print("userId - ", userId )
        # print("productId - ", productId )

        wishListObject = WishList.objects.filter(userId_id=userId).all()
        serializerClass = WishListSerializer(wishListObject, many=True)
        msg = {"msg": "wishlistGET", "wishlistData": serializerClass.data}

        return Response(msg)

    if request.method == "DELETE":

        wishListQuery = WishList.objects.filter(
            userId_id=userId, productId_id=productId
        ).exists()

        if wishListQuery:

            deleteQuery = WishList.objects.get(userId_id=userId, productId_id=productId)
            deleteQuery.delete()

            # print(deleteQuery)

            msg = {"status": 200, "msg": "ItemDeleted"}

            return JsonResponse(msg)

        else:

            return JsonResponse({"msg": "item not exist"})
