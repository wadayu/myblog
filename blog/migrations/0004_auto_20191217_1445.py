# -*- coding: utf-8 -*-
# Generated by Django 1.11.26 on 2019-12-17 06:45
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20191217_1116'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tag',
            name='owner',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='作者'),
        ),
    ]
