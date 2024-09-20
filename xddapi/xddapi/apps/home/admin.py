from django.contrib import admin
from .models import Banner,Nav
from user.models import User
# Register your models here.
admin.site.register(Banner)
admin.site.register(Nav)
admin.site.register(User)
