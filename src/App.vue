<template>
  <div id="app">
    <router-view />

  </div>
</template>

<script>
import StarRating from "vue-star-rating";
export default {
    name: "App",
    components: {
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
