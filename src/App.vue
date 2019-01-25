<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <Header />
    <router-view :key="routerKey" />
    <TabBar />
  </div>
</template>

<script>
import Header from '@/components/Header/Header.vue'
import TabBar from '@/components/TabBar/TabBar.vue'

export default {
  name: "App",
  components:{
    Header,
    TabBar
  },
  computed: {
    routerKey() {
        return this.$route.name !== undefined? this.$route.name +new Date(): this.$route +new Date()
    }
 }
};
</script>

<style>
  body {
    color: #565555;
  }
</style>
