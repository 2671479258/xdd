from django.contrib import admin
from .models import CourseCategory,Course,CourseChapter,Teacher,CourseLesson,CourseDiscountType,CourseDiscount,Activity,CoursePriceDiscount,CourseExpire
# Register your models here.
admin.site.register(CourseCategory)
admin.site.register(Course)
admin.site.register(CourseChapter)
admin.site.register(Teacher)
admin.site.register(CourseLesson)
admin.site.register(CourseDiscountType)
admin.site.register(CourseDiscount)
admin.site.register(Activity)
admin.site.register(CoursePriceDiscount)
admin.site.register(CourseExpire)

