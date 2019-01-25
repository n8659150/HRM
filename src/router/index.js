import Vue from 'vue'
import Router from 'vue-router'
import ResumeList from '@/components/ResumeList/ResumeList.vue'
import ResumeDetail from '@/components/ResumeDetail/ResumeDetail.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(Router);
Vue.use(BootstrapVue);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'ResumeList',
      component: ResumeList
    },
    {
      path: '/resume/:id',
      name: 'ResumeDetail',
      component: ResumeDetail
    }
  ]
})
