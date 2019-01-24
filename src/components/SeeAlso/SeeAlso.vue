<template>
  <div>
    <ul>
      <li v-for="resume in resumeList" :key="resume.id">
        <!-- <a href="">{{item}}</a> -->
        <router-link :to="{ name: 'ResumeDetail', params: { id: resume.id }}">{{resume.name}}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import { fetchResumeList } from "@/helpers/resumeFetch";
export default {
  name: "SeeAlso",
  data() {
    return {
      resumes: []
    };
  },
  props: ["resumeList"],

  mounted() {}
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>