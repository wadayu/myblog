# -*- coding: utf-8 -*-
# Generated by Django 1.11.26 on 2019-12-17 03:16
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20191128_1119'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='owner',
        ),
        migrations.AddField(
            model_name='post',
            name='pv',
            field=models.PositiveIntegerField(default=1, verbose_name='PV'),
        ),
        migrations.AddField(
            model_name='post',
            name='uv',
            field=models.PositiveIntegerField(default=1, verbose_name='UV'),
        ),
    ]