from django.shortcuts import render

# Create your views here.
from rest_framework.generics import ListAPIView
from .models import Banner
from .serializers import BannerModelSerializer
from xddapi.settings import constants

class BannerListAPIView(ListAPIView):

    queryset = Banner.objects.filter(is_show=True,is_deleted=False).order_by('-orders','-id')[:constants.Banner_Length]

    print(queryset)
    serializer_class = BannerModelSerializer



from .models import Nav
from .serializers import NavModelSerializer
class HeaderNavListAPIView(ListAPIView):
    """导航菜单视图"""
    queryset = Nav.objects.filter(is_show=True, is_deleted=False,position=1).order_by("-orders","-id")[:constants.HEADER_NAV_LENGTH]
    serializer_class = NavModelSerializer


class FooterNavListAPIView(ListAPIView):
    """导航菜单视图"""
    queryset = Nav.objects.filter(is_show=True, is_deleted=False,position=2).order_by("-orders","-id")[:constants.FOOTER_NAV_LENGTH]
    serializer_class = NavModelSerializer