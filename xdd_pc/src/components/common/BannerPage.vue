<template>
  <el-carousel height="720px" :interval="3000" arrow="always">
    <el-carousel-item :key="key" v-for="banner,key in banner_list">
      <a :href="banner.link"><img :src="banner.image_url"></a>
    </el-carousel-item>
  </el-carousel>
</template>


<script>
    export default {
        name: "BannerPage",
        data(){
            return {
                banner_list:[]
            }
        },
        created() {
            this.get_banner_list();
        },
        methods:{
            get_banner_list(){
                // 获取轮播广告列表
                this.$axios.get(`${this.$settings.HOST}/banner/`,{}).then(response=>{
                  this.banner_list = response.data;
                  console.log(this.banner_list)
                }).catch(error=>{
                  console.log(error.response)
                });
            }
        }
    }
</script>

<style scoped>
  .el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 300px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>
