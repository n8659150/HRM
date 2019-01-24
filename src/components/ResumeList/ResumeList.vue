<template>
<ul>
  <li v-for="item in list" :key="item">
    {{item}}
  </li>
</ul>
</template>

<script>
export default {
  name: "ResumeList",
  data() {
    return {
      list: ['1','2','3','4','5']
    };
  },

  methods: {

  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
