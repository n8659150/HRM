<template>
  <fixed-header :fixed.sync="isFixed" :threshold="1">
    <nav class="navbar" :class="{ 'is-light': isFixed, 'is-primary': !isFixed }">
        <div class="container">
          <div class="navbar-brand">
            <span class="navbar-item">
              Header Content
            </span>
          </div>
        </div>
      </nav>
  </fixed-header>
</template>

<script>
import FixedHeader from 'vue-fixed-header'
export default {
  name: "Header",
  data() {
    return {
      isFixed: false
    }
  },
  components: {
    FixedHeader
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
