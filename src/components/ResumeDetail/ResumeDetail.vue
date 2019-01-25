<template>
<<<<<<< HEAD
  <div class="container resume-detail" v-if="resume">
    <BasicInfo :resume="resume" style="margin-top: 20px;"></BasicInfo>
    <div class="gap"></div>
    <skills :skills="skills"></skills>
    <div class="gap"></div>
    <Experience :resume="resume"></Experience>
    <div class="gap"></div>
    <Education :resume="resume"></Education>
    <div class="gap"></div>
    <RateFlag :resume="resume"></RateFlag>
    <div class="gap"></div>
    <SeeAlso :resumeList="cachedResumes"></SeeAlso>
=======
  <div class="resume-detail" v-if="resume">
    <BasicInfo :resume="resume" class="block-content"></BasicInfo>
    <skills :skills="skills" class="block-content"></skills>
    <Experience :resume="resume" class="block-content"></Experience>
    <Education :resume="resume" class="block-content"></Education>
    <div class="control-panel"><div style="position: relative">
      <SeeAlso :resumeList="cachedResumes"></SeeAlso>
      </div>
    </div>
>>>>>>> update see also
  </div>
</template>

<script>
import { fetchResumeById } from "@/helpers/data";
import store from "@/helpers/store";
import BasicInfo from "@/components/basicInfo/BasicInfo.vue";
import Skills from "@/components/Skill/Skills.vue";
import Experience from "@/components/experience/Experience.vue";
import Education from "@/components/education/Education.vue";

import SeeAlso from "@/components/SeeAlso/SeeAlso.vue";
import RateFlag from "@/components/ResumeDetail/RateFlag.vue";

export default {
  name: "ResumeDetail",
  components: { Skills, SeeAlso, BasicInfo, Experience, Education, RateFlag},
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
  .block-content {
    background-color: white;
    padding: 1rem !important;
    margin-bottom: 1rem;
  }
  .gap {
    height: 20px;
    width: 100%;
    background-color: #f4f4f4;
  }

  .resume-detail {
    background-color: #f4f4f4;
  }

  .control-panel {
    position: fixed;
    width: 100%;
    bottom: 0;
  }

</style>
