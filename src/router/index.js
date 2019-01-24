import Vue from 'vue'
import Router from 'vue-router'
import ResumeList from '@/components/ResumeList/ResumeList.vue'
import ResumeDetail from '@/components/ResumeDetail/ResumeDetail.vue'

Vue.use(Router)

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
