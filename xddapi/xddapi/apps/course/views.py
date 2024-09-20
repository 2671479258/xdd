from rest_framework.generics import ListAPIView
from .models import CourseCategory, CourseChapter
from .serializers import CourseCategoryModelSerializer, CourseChapterModelSerializer


class CourseCategoryListAPIView(ListAPIView):
    """
    课程分类
    """
    queryset = CourseCategory.objects.filter(is_show=True, is_deleted=False).order_by("orders","-id")
    serializer_class = CourseCategoryModelSerializer

from .models import Course
from .serializers import CourseModelSerializer,CourseRetrieveModelSerializer

# class CourseListAPIView(ListAPIView):
#     queryset = Course.objects.filter(is_show=True, is_deleted=False).order_by("orders", "-id")
#     serializer_class = CourseModelSerializer
#
#     def get(self, request, *args, **kwargs):
#         response = super().get(request, *args, **kwargs)
#         print(f"Response Data: {response.data}")  # 调试输出
#         return response


from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import OrderingFilter
from .paginations import CoursePageNumberPagination
class CourseListAPIView(ListAPIView):
    """课程列表"""
    queryset = Course.objects.filter(is_show=True, is_deleted=False).order_by("orders","-id")
    serializer_class = CourseModelSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filter_fields = ['course_category']
    ordering_fields = ('id', 'students', 'price')
    pagination_class = CoursePageNumberPagination

from rest_framework.generics import RetrieveAPIView

class CourseRetrieveAPIView(RetrieveAPIView):
    queryset = Course.objects.filter(is_show=True, is_deleted=False).order_by("orders","-id")
    serializer_class = CourseRetrieveModelSerializer
class CourseChapterListAPIView(ListAPIView):
    serializer_class = CourseChapterModelSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['course']

    def get_queryset(self):
        queryset = CourseChapter.objects.filter(is_show=True, is_deleted=False).order_by("orders", "id")
        course = self.request.query_params.get('course', None)
        if course is not None:
            queryset = queryset.filter(course_id=course)
        return queryset

from rest_framework.viewsets import ModelViewSet
class Test(ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = CourseCategoryModelSerializer

