# Generated by Django 4.2.2 on 2023-07-17 18:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userApi', '0011_placeorder'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='placeorder',
            name='productId',
        ),
        migrations.RemoveField(
            model_name='placeorder',
            name='qty',
        ),
    ]
