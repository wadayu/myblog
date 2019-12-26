from django.contrib import admin
import xadmin

from .models import Link, SideBar
from extra.base_admin import BaseOwnerAdmin


class LinkAdmin(BaseOwnerAdmin):
    list_display = ('title', 'href', 'status', 'weight', 'created_time', 'owner')
    fields = ('title', 'href', 'status', 'weight')
    model_icon = 'fa fa-chain'


class SideBarAdmin(BaseOwnerAdmin):
    list_display = ('title', 'display_type', 'content', 'created_time', 'owner')
    fields = ('title', 'display_type', 'content', 'status')
    model_icon = 'fa fa-bars'


xadmin.site.register(Link, LinkAdmin)
xadmin.site.register(SideBar, SideBarAdmin)