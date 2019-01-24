<template>
  <div>
    <div v-if="resume">{{ resume.name }}</div>
    <skill name="ssssss"></skill>
    <SeeAlso :resumeList="cachedResumes"></SeeAlso>
  </div>
</template>

<script>
import { fetchResumeById } from "@/helpers/resumeFetch";
import store from "@/helpers/store";
import Skill from "@/components/Skill/Skill.vue";
import SeeAlso from "@/components/SeeAlso/SeeAlso.vue";
export default {
  name: "ResumeDetail",
  components: { Skill, SeeAlso },
  data() {
    return {
      resume: null,
      cachedResumes: []
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
    let cachedResumes = store.fetch("cachedResumes");
    if (cachedResumes) {
      this.cachedResumes = cachedResumes;
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
