# Generated by Django 3.2.23 on 2024-07-04 11:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0003_courselesson_course'),
    ]

    operations = [
        migrations.AlterField(
            model_name='courselesson',
            name='is_show',
            field=models.BooleanField(default=True, verbose_name='是否展示'),
        ),
    ]
