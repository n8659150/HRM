<template>
  <fixed-header :threshold="1">
    <nav class="navbar">
        <div class="navbar-brand">
          <span class="navbar-item">
            <i  @click="back()" class="fa fa-arrow-left" aria-hidden="true"></i>
          </span>
        </div>

        <div class="navbar-brand">
          <span class="navbar-item">
            <i class="fa fa-sliders" aria-hidden="true"></i>
          </span>
        </div>

      </nav>
  </fixed-header>


</template>

<script>
import FixedHeader from 'vue-fixed-header'
import StarRating from 'vue-star-rating'
export default {
  name: "Header",
  components: { StarRating , FixedHeader},
  data() {
    return {
      resumes: [],
    }
  },
  methods: {
    back() {
      this.$router.go(-1); //返回上一层
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
html,
body,
#app {
  width: 100%;
  min-height: 110vh;
  margin: 0;
  padding: 0;
}
.navbar {
  position: fixed;
  width: 100%;
  transition: background 0.15s ease-out;
  background: transparent;
  z-index: 10000;
  height: 2.5rem;
  background-color: #f4f4f4;
}

.header {

}

</style>
