<template>
<div class="skills">
  <div>
    <h5 class="block-title">Skills</h5>
  </div>

  <b-badge style="padding: 5px; margin-right: 10px;"
      v-for="skill in skills" :key="skill" variant="info">
    <span>{{ skill }}</span>
  </b-badge>
</div>
</template>

<script>
export default {
  name: "Skills",
  props: ["skills"],
  data() {
    return {
    };
  },
   methods: {
  }
};
</script>

<style scoped>
  .skills {
    padding: 1em 0 1em 0;
  }
</style>
