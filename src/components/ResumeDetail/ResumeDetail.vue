<template>
  <div class="container resume-detail" v-if="resume">
    <BasicInfo :resume="resume" style="margin-top: 20px;"></BasicInfo>
    <div class="gap"></div>
    <skills :skills="skills"></skills>
    <div class="gap"></div>
    <SeeAlso :resumeList="cachedResumes"></SeeAlso>
  </div>
</template>

<script>
import { fetchResumeById } from "@/helpers/resumeFetch";
import store from "@/helpers/store";
import BasicInfo from "@/components/basicInfo/BasicInfo.vue";
import Skills from "@/components/Skill/Skills.vue";
import SeeAlso from "@/components/SeeAlso/SeeAlso.vue";

export default {
  name: "ResumeDetail",
  components: { Skills, SeeAlso, BasicInfo },
  data() {
    return {
      resume: null,
      cachedResumes: [],
      skills: ["AngularJS", "Javascript", "Node.js", "HTML", "CSS"]
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
  .gap {
    height: 20px;
    width: 200%;
    margin-left: -100px;
    background-color: #f4f4f4;
  }
</style>
