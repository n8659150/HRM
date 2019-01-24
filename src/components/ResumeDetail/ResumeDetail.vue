<template>
  <div>
    <div v-if="resume">{{ resume.name }}</div>
    <skill name="ssssss"></skill>
  </div>
</template>

<script>
import { fetchResumeById } from "@/helpers/resumeFetch";
import Skill from '@/components/Skill/Skill.vue';
export default {
  name: "ResumeDetail",
  components: { Skill},
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
