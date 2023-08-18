# Generated by Django 4.2.2 on 2023-07-15 10:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('vendor', '0009_addproduct_setfeatured'),
        ('userApi', '0010_address_recivername'),
    ]

    operations = [
        migrations.CreateModel(
            name='PlaceOrder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productsArray', models.CharField(max_length=100)),
                ('qty', models.IntegerField(null=True)),
                ('cartAmount', models.IntegerField()),
                ('paymentId', models.IntegerField(null=True)),
                ('paymentMode', models.CharField(max_length=30)),
                ('trackingNo', models.IntegerField()),
                ('status', models.IntegerField()),
                ('date', models.DateTimeField()),
                ('addressId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userApi.address')),
                ('productId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='vendor.addproduct')),
                ('userId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userApi.usersignup')),
            ],
        ),
    ]