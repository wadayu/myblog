from django.contrib import admin

from .models import Link, SideBar
from extra.base_admin import BaseOwnerAdmin


@admin.register(Link)
class LinkAdmin(BaseOwnerAdmin):
    list_display = ('title', 'href', 'status', 'weight', 'created_time', 'owner')
    fields = ('title', 'href', 'status', 'weight')


@admin.register(SideBar)
class SideBarAdmin(BaseOwnerAdmin):
    list_display = ('title', 'display_type', 'content', 'created_time', 'owner')
    fields = ('title', 'display_type', 'content', 'status')

