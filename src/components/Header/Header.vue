<template>
  <fixed-header :fixed.sync="isFixed" :threshold="1">
    <nav class="navbar" :class="{ 'is-light': isFixed, 'is-primary': !isFixed }">
        <div class="container">
          <div class="navbar-brand">
            <span class="navbar-item">
              Header Content
            </span>
            <b-dropdown size=sm>
              <star-rating v-bind:max-rating="5" v-bind:star-size="25" v-bind:rounded-corners=true v-bind:show-rating=false v-bind:padding="8" @rating-selected ="filterByStar"></star-rating>
            </b-dropdown>
          </div>
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
      isFixed: false
    }
  },
  methods: {
      filterByStar(rating) {
        this.resumes.filter( resume => {
          return resume.stars === rating;
        })
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
}
.navbar.is-primary {
  background: green;
}
.navbar.is-light {
  background: blue;
}
</style>
