# Generated by Django 4.2.2 on 2023-08-23 07:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vendor', '0014_remove_addproduct_category_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subcategory',
            name='cat_name',
        ),
    ]
