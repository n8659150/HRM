<template>
  <div id="app">
    <router-view :key="routerKey" />

  </div>
</template>

<script>
import TabBar from "@/components/TabBar/TabBar.vue";
import StarRating from "vue-star-rating";
export default {
    name: "App",
    components: {
        TabBar,
        StarRating
    },
    computed: {
        routerKey() {
            return this.$route.name !== undefined
                ? this.$route.name + new Date()
                : this.$route + new Date();
        }
    }
};
</script>

<style>
body {
    color: #565555;
}
.header-fix {
    padding-top: 56px;
}
</style>
