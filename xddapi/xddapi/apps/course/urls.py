from django.urls import path, re_path, include
from . import views

from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register('test',views.Test)
urlpatterns = [
    path(r"category/", views.CourseCategoryListAPIView.as_view() ),
    path(r"", views.CourseListAPIView.as_view() ),
    re_path(r"(?P<pk>\d+)/", views.CourseRetrieveAPIView.as_view()),
    path(r"chapter/", views.CourseChapterListAPIView.as_view()),
    path("",include(router.urls))

]