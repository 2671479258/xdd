<template>
  <div class="cart">
    <Header />
    <div class="cart__info">
      <div class="cart__title">
        <span class="cart__title-text">我的购物车</span>
        <span class="cart__title-total">共{{$store.state.cart_length}}门课程</span>
      </div>
      <div class="cart__table">
        <div class="cart__head-row">
          <span class="cart__column cart__column--doing"></span>
          <span class="cart__column cart__column--course">课程</span>
          <span class="cart__column cart__column--expire">有效期</span>
          <span class="cart__column cart__column--price">单价</span>
          <span class="cart__column cart__column--do-more">操作</span>
        </div>
        <!-- 购物车中商品列表 -->
        <div class="cart__course-list">
<CartItem :key="key" v-for="(course, key) in course_list"
          @update-expire="updateExpire($event)"
          @update-selected="updateSelected($event)"
          @change_select="calc_total"
          :course="course"
          @delete_course="del_cart(key)">
</CartItem>
        </div>
        <div class="cart__footer-row">
          <span class="cart__select">
            <label>
              <el-checkbox v-model="checked"></el-checkbox>
              <span>全选</span>
            </label>
          </span>
          <span class="cart_delete"><i class="el-icon-delete"></i> <span>删除</span></span>
          <span class="cart__goto-pay">去结算</span>
          <span class="cart__total">总计：¥{{total_price.toFixed(2)}}</span>
        </div>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from "./common/HeaderPage";
import Footer from "./common/FooterPage";
import CartItem from "./common/CartItem";

export default {
  name: "CartPage",
  data() {
    return {
      token:"",
      course_list:[],
      total_price: 0.00,
      checked: false,
    };
  },
  created(){
    this.token=this.check_user_login()
    this.get_cart()
  },
  methods:{
    updateExpire(eventData) {
        // 更新 course_list 中的有效期数据
        let { courseId, expireId } = eventData;
        let course = this.course_list.find(c => c.id === courseId);
        if (course) {
            course.expire_id = expireId;
            this.calc_total();
        }
    },

    updateSelected(eventData) {
        // 更新 course_list 中的选中状态数据
        let { courseId, selected } = eventData;
        let course = this.course_list.find(c => c.id === courseId);
        if (course) {
            course.selected = selected;
            this.calc_total();
        }
    },
    calc_total(){
        // 计算购物车勾选商品的总价格
          /**
             // 在javascript中，数组有一个默认的方法，forEach可以用于对数组进行便利
             arr1 = ["a","b","c","d"]
             arr1.forEach(function(value,key){
                  console.log(`下标：${key}，值=${value}`);
             });
           */
        console.log(this.course_list)
        let total = 0;
        // eslint-disable-next-line
        this.course_list.forEach((course,key)=>{
          if(course.selected){
            total += parseFloat( course.price );
          }
        });
        this.total_price = total;
        console.log(this.total_price)
      },
    get_cart(){
          // 获取购物车中的商品信息
          this.$axios.get(`${this.$settings.HOST}/cart/`,{
              headers:{
                  "Authorization": "jwt " + this.token,
              }
          }).then(response=>{
              this.course_list = response.data;
              this.$store.commit("add_cart", this.course_list.length);
              this.calc_total();
          }).catch(error=>{
              console.log(error.response);
          })
      },
    check_user_login(){
        let token = localStorage.user_token || sessionStorage.user_token;
        if( !token ){
            let self = this;
            this.$confirm("对不起，您尚未登录！所以请登录再使用购物车","路飞学城",{
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                self.$router.push("/user/login");
            });
            return false; // 阻止js继续往下执行
        }
        return token;
      },
    del_cart(key){
        // 从购物车中删除指定商品
        this.course_list.splice(key,1);
        // 删除商品课程以后，还要重新计算新的总价
        this.calc_total();
      },
  },
  components: {
    Header,
    Footer,
    CartItem,
  },
};
</script>

<style scoped>
.cart__info {
  width: 1200px;
  margin: 0 auto 200px;
}

.cart__title {
  margin: 25px 0;
}

.cart__title-text {
  font-size: 18px;
  color: #666;
}

.cart__title-total {
  font-size: 12px;
  color: #d0d0d0;
}

.cart__table {
  width: 1170px;
}

.cart__head-row {
  background: #f7f7f7;
  width: 100%;
  height: 80px;
  line-height: 80px;
  padding-right: 30px;
}

.cart__head-row::after {
  content: "";
  display: block;
  clear: both;
}

.cart__column {
  padding-left: 10px;
  height: 80px;
  float: left;
}

.cart__column--doing {
  width: 78px;
}

.cart__column--course {
  width: 530px;
}

.cart__column--expire {
  width: 188px;
}

.cart__column--price {
  width: 162px;
}

.cart__column--do-more {
  width: 162px;
}

.cart__footer-row {
  padding-left: 30px;
  background: #f7f7f7;
  width: 100%;
  height: 80px;
  line-height: 80px;
}

.cart__select span {
  margin-left: 7px;
  font-size: 18px;
  color: #666;
}

.cart__delete {
  margin-left: 58px;
}

.cart__delete .el-icon-delete {
  font-size: 18px;
}

.cart__delete span {
  margin-left: 15px;
  cursor: pointer;
  font-size: 18px;
  color: #666;
}

.cart__total {
  float: right;
  margin-right: 62px;
  font-size: 18px;
  color: #666;
}

.cart__goto-pay {
  float: right;
  width: 159px;
  height: 80px;
  outline: none;
  border: none;
  background: #ffc210;
  font-size: 18px;
  color: #fff;
  text-align: center;
  cursor: pointer;
}
</style>