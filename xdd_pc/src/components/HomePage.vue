<template>
    <div class="home">
      <Header></Header>
      <Banner></Banner>
      <Footer></Footer>
    </div>
</template>


<script>
  import Header from "./common/HeaderPage"
  import Banner from "./common/BannerPage"
  import Footer from "./common/FooterPage"
  export default {
      name: "HomePage",
      data(){
        return {}
      },
      methods:{

      },
      components:{
        Header,
        Footer,
        Banner,
      }
  }
</script>

<style scoped>

</style>
