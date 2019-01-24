<template>
  <div class="hello">
    <cube-scroll-nav-bar :current="current" :labels="labels" @change="changeHandler" />
    <ResumeList></ResumeList>
    <cube-tab-bar
      v-model="selectedLabelDefault"
      :data="tabs"
      @click="clickHandler"
      @change="changeHandler"
    ></cube-tab-bar>
  </div>
</template>

<script>
import ResumeList from '@/components/ResumeList/ResumeList.vue'
export default {
  name: "HelloWorld",
  data() {
    return {
      current: '快车',
      labels: [
        '快车',
        '小巴',
        '专车',
        '顺风车',
        '代驾',
        '公交',
        '自驾租车',
        '豪华车',
        '二手车',
        '出租车'
      ],
      selectedLabelDefault: "Vip",
      tabs: [
        {
          label: "Home",
          icon: "cubeic-home"
        },
        {
          label: "Like",
          icon: "cubeic-like"
        },
        {
          label: "Vip",
          icon: "cubeic-vip"
        },
        {
          label: "Me",
          icon: "cubeic-person"
        }
      ]
    };
  },
  methods: {
    changeHandler(cur) {
      this.current = cur
    },
    clickHandler (label) {
      // if you clicked home tab, then print 'Home'
      console.log(label)
    }
  },
  components: { ResumeList }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
