# Generated by Django 4.2.2 on 2023-07-11 11:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userApi', '0002_cart'),
    ]

    operations = [
        migrations.RenameField(
            model_name='cart',
            old_name='venId',
            new_name='userId',
        ),
    ]