import Vue from 'vue'
import Router from 'vue-router'
import ResumeList from '@/components/ResumeList/ResumeList.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'ResumeList',
      component: ResumeList
    }
  ]
})
