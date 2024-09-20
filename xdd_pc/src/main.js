import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store'; // 引入 Vuex Store
import settings from './settings';

Vue.prototype.$settings = settings;
Vue.config.productionTip = false;

// Element UI 配置
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

// Axios 配置
import axios from 'axios';
axios.defaults.withCredentials = false;
Vue.prototype.$axios = axios;

// 调用插件
Vue.use(ElementUI);

// vue-video-player 视频播放器
require('video.js/dist/video-js.css');
require('vue-video-player/src/custom-theme.css');
import VideoPlayer from 'vue-video-player';
Vue.use(VideoPlayer);

import "../static/css/reset.css";

new Vue({
  router,
  store, // 注入 Store
  render: h => h(App)
}).$mount('#app');