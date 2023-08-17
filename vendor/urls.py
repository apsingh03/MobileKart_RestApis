from django.contrib import admin
from django.urls import path , include
from vendor import views



urlpatterns = [

     path('hello/', views.HelloView.as_view(), name ='hello'),
    
    path('', views.vendor_Home , name="vendor_Home" ),

    path('addcategory', views.AddCategory_view , name="vendor_AddCategory" ),

    path('add-sub-category', views.AddSubCategory_view , name="AddSubCategory_view" ),

    path('add-tax', views.AddTax_view , name="AddTax_view" ),

    path('add-shipping', views.AddShipping_view , name="AddShipping_view" ),

    path('get-subcat-bycategory/<str:pk>/', views.GetSubCategoryByID_view , name="GetSubCategoryByID_view" ),

    path('signup', views.Signup_view , name="Signup_view" ),

    path('vendorLogin', views.Login_view , name="Login_view" ),

    path('addproduct', views.addProduct_view , name="addProduct_view" ),

    path('filter-productdetail-bySlug/<str:pk>/', views.FilterProductBySlug_view , name="FilterProductBySlug_view" ),

    path('set-featuredProduct-byId/<str:pk1>/<str:pk2>/', views.SetFeaturedProductById_view , name="SetFeaturedProductById_view" ),

    
    path('update-productdetail-byId/<str:pk>/', views.UpdateProductByID_view , name="UpdateProductByID_view" ),

        
    path('delete-product-byId/<str:pk1>/<str:pk2>/', views.DeleteProductByID_view , name="DeleteProductByID_view" ),

     path('duplicate-product-byId/<str:pk1>/<str:pk2>/', views.DuplicateProductByID_view , name="DuplicateProductByID_view" ),


    
     path('permanent-delete-product-byId/<str:pk1>/<str:pk2>/', views.PermanentDeleteProductByID_view , name="PermanentDeleteProductByID_view" ),


]
