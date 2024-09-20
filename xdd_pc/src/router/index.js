import Vue from 'vue'
import Router from 'vue-router'
import HomePage from "../components/HomePage"
import LoginPage from "../components/LoginPage"
import RegisterPage from "../components/RegisterPage"
import CoursePage from "@/components/CrousePage"
import DetailPage from "@/components/DetailPage"
import CartPage from "@/components/CartPage"
Vue.use(Router);
export default new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      name: "HomePage",
      component: HomePage,
    },
      {
      path: '/home',
      name: "HomePage",
      component: HomePage,
    },
      {
      path: '/user/login',
      name: "LoginPage",
      component: LoginPage,
    },
       {
      path: '/user/reg',
      name: "RegisterPage",
      component: RegisterPage,
    },
      {
      path: '/courses',
      name: "CoursePage",
      component: CoursePage,
    },
       {
      path: '/courses/detail/:id',
      name: "DetailPage",
      component: DetailPage,
    },
      {
      path: '/cart',
      name: "CartPage",
      component: CartPage,
    },
  ]
})
