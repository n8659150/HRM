<template>
  <div id="app">
    <Header></Header>
    <router-view/>
  </div>
</template>

<script>
import StarRating from "vue-star-rating";
import Header from "@/components/Header/Header.vue";

export default {
  name: "App",
  components: {
    StarRating,
    Header
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

.space-between {
  display: flex;
  justify-content: space-between;
}

.badge-warning {
  color: #565555;
  font-weight: normal;
}
</style>
