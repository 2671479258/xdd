<template>
    <div class="cart_item">
      <div class="cart_column column_1">
        <el-checkbox class="my_el_checkbox" v-model="selected" @change="change_selected"></el-checkbox>
      </div>
      <div class="cart_column column_2">
        <img :src="course.course_img" alt="">
        <span><router-link :to="'/courses/detail/'+course.id">{{course.name}}</router-link></span>
      </div>
      <div class="cart_column column_3">
        <el-select v-model="expire_id" size="mini" placeholder="请选择购买有效期" class="my_el_select" @change="change_expire">
          <el-option v-for="item in course.expire_list" :label="item.expire_text" :value="item.id" :key="item.id" ></el-option>
        </el-select>
      </div>
      <div class="cart_column column_4">¥{{localPrice}}</div>
      <div class="cart_column column_4" @click="delete_course">删除</div>
    </div>
</template>

<script>
export default {
    name: "CartItem",
    props:["course"],
    data(){
      return {
        selected: this.course.selected,
        expire_id: this.course.expire_id || this.getPermanentExpireId(), // 初始化为永久有效选项的 id
        localPrice: this.course.price
      }
    },
    watch:{
        "course.selected": function(newVal){
            this.selected = newVal;
        },
        "course.expire_id": function(newVal){
            this.expire_id = newVal;
            this.change_expire();
        }
    },
    methods:{
      getPermanentExpireId() {
        // 根据你的数据结构找到永久有效选项的 id
        for (let item of this.course.expire_list) {
            if (item.expire_text === "永久有效") {
                return item.id;
            }
        }
        return null; // 如果找不到，默认返回 null 或者你认为合适的默认值
    },
        change_expire(){
            let token = localStorage.user_token || sessionStorage.user_token;
            this.$axios.put(`${this.$settings.HOST}/cart/`, {
                expire_id: this.expire_id,
                course_id: this.course.id
            }, {
                headers: {
                    "Authorization": "jwt " + token,
                }
            }).then(response => {
                this.$message.success(response.data.message);
        this.localPrice = response.data.real_price;
        // 更新 course.expire_id
        this.$emit("update-expire", { courseId: this.course.id, expireId: this.localExpireId });
        // 立即触发 change_select 事件，通知父组件重新计算总价格

        // 触发 update-expire 事件，通知父组件更新有效期
        this.$emit("update-expire", { courseId: this.course.id, expireId: this.expire_id });

            }).catch(error => {
                this.$message.error(error.response);
            })
        },
        change_selected(){
            let token = localStorage.user_token || sessionStorage.user_token;
            this.$axios.patch(`${this.$settings.HOST}/cart/`, {
                selected: this.selected,
                course_id: this.course.id
            }, {
                headers: {
                    "Authorization": "jwt " + token,
                }
            }).then(response => {
                this.$message.success(response.data.message);
                this.$emit("update-selected", { courseId: this.course.id, selected: this.selected });

            }).catch(error => {
                this.$message.error(error.response);
            })
        },
      delete_course(){
            let token = localStorage.user_token || sessionStorage.user_token;
            this.$axios.delete(`${this.$settings.HOST}/cart/`,{
                params:{
                    course_id: this.course.id
                },
                headers:{
                    "Authorization": "jwt " + token,
                }
            }).then(response=>{
                this.$message.success(response.data.message);
                // 当子组件中，切换了商品课程的勾选状态，则通知父组件重新计算购物商品总价
                this.$emit("delete_course");

            }).catch(error=>{
                this.$message.error(error.response);
            });
        }
    }
}
</script>
<style scoped>
.cart_item::after{
  content: "";
  display: block;
  clear: both;
}
.cart_column{
  float: left;
  height: 250px;
}
.cart_item .column_1{
  width: 88px;
  position: relative;
}
.my_el_checkbox{
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  margin: auto;
  width: 16px;
  height: 16px;
}
.cart_item .column_2 {
  padding: 67px 10px;
  width: 520px;
  height: 116px;
}
.cart_item .column_2 img{
  width: 175px;
  height: 115px;
  margin-right: 35px;
  vertical-align: middle;
}
.cart_item .column_3{
  width: 197px;
  position: relative;
  padding-left: 10px;
}
.my_el_select{
  width: 117px;
  height: 28px;
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto;
}
.cart_item .column_4{
  padding: 67px 10px;
  height: 116px;
  width: 142px;
  line-height: 116px;
}

</style>