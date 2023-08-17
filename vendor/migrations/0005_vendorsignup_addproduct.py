# Generated by Django 4.2.2 on 2023-07-07 10:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('vendor', '0004_shipping'),
    ]

    operations = [
        migrations.CreateModel(
            name='vendorSignup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ven_name', models.CharField(max_length=200)),
                ('ven_email', models.EmailField(max_length=200)),
                ('ven_pass', models.CharField(max_length=200)),
                ('ven_isLogged', models.BooleanField(null=True)),
                ('date', models.DateTimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='addProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('mrp', models.IntegerField()),
                ('discountPercent', models.IntegerField()),
                ('productType', models.CharField(max_length=200)),
                ('Category', models.CharField(max_length=200)),
                ('subCategory', models.CharField(max_length=200)),
                ('taxStatus', models.CharField(max_length=200)),
                ('shipping', models.CharField(max_length=200, null=True)),
                ('totalUnits', models.IntegerField()),
                ('stockStatus', models.CharField(max_length=200)),
                ('trackQty', models.BooleanField()),
                ('productDescription', models.TextField(null=True)),
                ('image1', models.CharField(max_length=1000, null=True)),
                ('image2', models.CharField(max_length=1000, null=True)),
                ('image3', models.CharField(max_length=1000, null=True)),
                ('image4', models.CharField(max_length=1000, null=True)),
                ('image5', models.CharField(max_length=1000, null=True)),
                ('date', models.DateTimeField(null=True)),
                ('venId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='vendor.vendorsignup')),
            ],
        ),
    ]
