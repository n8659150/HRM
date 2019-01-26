<template>
  <div class="resume-detail" v-if="resume">
    <BasicInfo :resume="resume" class="block-content"></BasicInfo>
    <skills :skills="skills" class="block-content"></skills>
    <Experience :resume="resume" class="block-content"></Experience>
    <Education :resume="resume" class="block-content"></Education>
    <ControlPanel :resume="resume" :resumeList="cachedResumes" ></ControlPanel>
  </div>
</template>

<script>
import { fetchResumeById } from "@/helpers/data";
import FixedHeader from 'vue-fixed-header';
import store from "@/helpers/store";
import BasicInfo from "@/components/basicInfo/BasicInfo.vue";
import Skills from "@/components/Skill/Skills.vue";
import Experience from "@/components/experience/Experience.vue";
import Education from "@/components/education/Education.vue";
import ControlPanel from "@/components/ResumeDetail/ControlPanel.vue";

export default {
  name: "ResumeDetail",
  components: { FixedHeader, Skills, BasicInfo, Experience, Education, ControlPanel},
  data() {
    return {
      resume: null,
      cachedResumes: [],
      skills: ["AngularJS", "Javascript", "Node.js", "HTML", "CSS"],
      isFixed: false
    };
  },
  methods: {
    async fetchCurrentResume(id) {
      let result = await fetchResumeById(id);
      this.resume = result.data;
    }
  },
  mounted() {
    this.fetchCurrentResume(this.$route.params.id);
    let cachedResumes = store.fetch("cachedResumes");
    if (cachedResumes) {
      this.cachedResumes = cachedResumes;
    }
  },
  beforeRouteUpdate(to,from,next){
    this.fetchCurrentResume(to.params.id);
    next()
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
    padding-top: 2rem;
  }

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
  background-color: #f4f4f4;
  height: 2rem;
}

</style>
