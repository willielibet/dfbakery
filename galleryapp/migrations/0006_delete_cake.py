# Generated by Django 4.2.6 on 2023-12-08 20:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('galleryapp', '0005_gallerypicture_cake_type_gallerypicture_color_and_more'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Cake',
        ),
    ]