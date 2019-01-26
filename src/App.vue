<template>
  <div id="app">
    <Header></Header>
    <router-view />
  </div>
</template>

<script>
import StarRating from "vue-star-rating";
import Header from "@/components/Header/Header.vue";

export default {
    name: "App",
    components: {
        StarRating, Header
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
