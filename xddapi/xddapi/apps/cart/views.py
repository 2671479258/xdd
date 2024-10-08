from django.shortcuts import render
from rest_framework.permissions import IsAuthenticated
from django_redis import get_redis_connection
from rest_framework import status
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from course.models import Course, CourseExpire
import logging
from xddapi.settings import constants
log = logging.getLogger("django")

class CartAPIView(ViewSet):
    # permission_classes = [IsAuthenticated]
    def add(self, request):
        course_id = request.data.get("course_id")
        # user_id = request.user.id
        user_id =1

        selected = True
        expire = 0

        try:
            course = Course.objects.get(is_show=True, is_deleted=False, id=course_id)
        except Course.DoesNotExist:
            return Response({"message":"参数有误！课程不存在！"}, status=status.HTTP_400_BAD_REQUEST)

        redis_conn = get_redis_connection("cart")\

        try:
            pipe = redis_conn.pipeline()
            pipe.multi()
            pipe.hset("cart_%s" % user_id, course_id, expire)
            pipe.sadd("selected_%s" % user_id, course_id)
            pipe.execute()

            # 查询购物车中商品总数
            course_len = redis_conn.hlen("cart_%s" % user_id)

        except:
            log.error("购物车数据存储错误！")
            return Response({"message": "参数有误！购物车添加商品失败！"}, status=status.HTTP_507_INSUFFICIENT_STORAGE)

        return Response({"message": "购物车商品添加成功！", "cart_length": course_len})

    def list(self,request):
        """购物车中的商品列表"""
        user_id = request.user.id
        # 从redis中读取数据
        redis_conn = get_redis_connection("cart")
        cart_bytes_dict = redis_conn.hgetall("cart_%s" % user_id )
        selected_bytes_list = redis_conn.smembers("selected_%s" % user_id )
        # 使用循环从mysql中根据课程ID提取对应的商品信息[商品ID，商品封面图片，商品标题]
        data = []
        for course_id_bytes,expire_id_bytes in cart_bytes_dict.items():
            course_id = course_id_bytes.decode()
            expire_id = int(expire_id_bytes.decode())
            try:
                course = Course.objects.get(is_show=True, is_deleted=False, pk=course_id)
            except Course.DoesNotExist:
                continue



            data.append({
                "selected": True if course_id_bytes in selected_bytes_list else False,
                "course_img": constants.SERVER_IMAGE_DOMAIN + course.course_img.url,
                "name": course.name,
                "id": course.id,
                "expire_id": expire_id,
                "expire_list":course.expire_list,
                "price": course.real_price(expire_id),
            })
        return Response(data)

    def change_selected(self, request):
        """切换购物车商品的勾选状态"""
        user_id = request.user.id
        selected = request.data.get("selected")
        course_id = request.data.get("course_id")
        try:
            Course.objects.get(is_show=True, is_deleted=False, id=course_id)
        except Course.DoesNotExist:
            return Response({"message": "参数有误！当前商品课程不存在！"}, status=status.HTTP_400_BAD_REQUEST)

        redis_conn = get_redis_connection("cart")
        if selected:
            redis_conn.sadd("selected_%s" % user_id, course_id)
        else:
            redis_conn.srem("selected_%s" % user_id, course_id)

        return Response({"message": "切换勾选状态成功！"})

    def change_expire(self, request):
        """切换购物车商品的有效期"""
        user_id = request.user.id
        expire_id = int(request.data.get("expire_id"))
        course_id = int(request.data.get("course_id"))

        try:
            # 判断课程是否存在
            course = Course.objects.get(is_show=True, is_deleted=False, id=course_id)
            # 判断课程的有效期选项是0还是其他的数值，如果是其他数值，还要判断是否存在于有效期选项表中
            if expire_id > 0:
                expire_item = CourseExpire.objects.filter(is_show=True, is_deleted=False, id=expire_id)
                if not expire_item.exists():
                    raise Course.DoesNotExist()
        except Course.DoesNotExist:
            return Response({"message": "参数有误！当前商品课程不存在或者不存在的有效期！"}, status=status.HTTP_400_BAD_REQUEST)

        redis_conn = get_redis_connection("cart")

        # 测试 Redis 连接
        try:
            redis_conn.ping()
            print("Redis 连接成功")
        except Exception as e:
            return Response({"message": f"Redis 连接失败: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        # 打印写入前的状态
        print(f"Redis Key: cart_{user_id}, Course ID: {course_id}, Expire ID: {expire_id}")

        try:
            redis_conn.hset(f"cart_{user_id}", course_id, expire_id)
            print(f"Updated Redis: cart_{user_id} {course_id} -> {expire_id}")  # 打印更新日志
        except Exception as e:
            return Response({"message": f"Redis 更新失败: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        # 在切换有效期选项以后，重新获取真实价格
        real_price = course.real_price(expire_id)

        return Response({"message": "切换课程有效期成功！", "real_price": real_price})

    def del_cart(self,request):
        """从购物车中商品商品信息"""
        user_id = request.user.id
        course_id = request.query_params.get("course_id")
        try:
            Course.objects.get(is_show=True, is_deleted=False, id=course_id)
        except Course.DoesNotExist:
            return Response({"message":"参数有误！当前商品课程不存在！"}, status=status.HTTP_400_BAD_REQUEST)

        redis_conn = get_redis_connection("cart")
        pipe = redis_conn.pipeline()
        pipe.multi()
        pipe.hdel('cart_%s' % user_id, course_id)
        pipe.srem("selected_%s" % user_id, course_id)
        pipe.execute()

        return Response({"message":"删除商品成功！"})



