<template>
  <div v-if="resume">{{ resume.name }}</div>
</template>

<script>
import { fetchResumeById } from "@/helpers/resumeFetch";
export default {
  name: "ResumeDetail",
  data() {
    return {
      resume: null
    };
  },
  methods: {
    async fetchCurrentResume() {
      let result = await fetchResumeById(this.$route.params.id);
      this.resume = result.data;
    }
  },
  mounted() {
    this.fetchCurrentResume();
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>