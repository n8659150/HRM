<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <Header />
    <router-view/>
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
  }
};
</script>

<style>

</style>
