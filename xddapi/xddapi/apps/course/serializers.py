from rest_framework import serializers
from .models import CourseCategory, CourseLesson, CourseChapter


class CourseCategoryModelSerializer(serializers.ModelSerializer):
    """
    课程分类序列化器
    """
    class Meta:
        model = CourseCategory
        fields = ["id","name"]

from .models import Course,Teacher

class TeacherModelSerializer(serializers.ModelSerializer):
    """
    老师信息序列化器
    """
    class Meta:
        model = Teacher
        fields = ["id","image","name","title","signature","brief"]

from rest_framework import serializers

class CourseModelSerializer(serializers.ModelSerializer):
    teacher = TeacherModelSerializer()
    lessons_list = serializers.ReadOnlyField()

    class Meta:
        model = Course
        fields = ["id", "name", "students", "lessons", "pub_lessons", "price", "course_img", "teacher", "lessons_list","discount_name","real_price"]

class CourseRetrieveModelSerializer(serializers.ModelSerializer):
    teacher = TeacherModelSerializer()

    class Meta:
        model = Course
        fields = ["id", "name", "students", "lessons", "pub_lessons", "price", "course_img", "course_video","teacher", "level_name","lessons_list","brief_html","discount_name","real_price","activity_time"]

class CourseLessonModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseLesson
        fields = ["id","lesson","name","free_trail"]

class CourseChapterModelSerializer(serializers.ModelSerializer):
    """
    详情页课程章节列表
    """
    coursesections = CourseLessonModelSerializer(many=True)
    class Meta:
        model = CourseChapter
        fields = ["id","chapter","name","coursesections","course"]