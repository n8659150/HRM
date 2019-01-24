<template>
<ul>
  <li v-for="resume in resumes" :key="resume.id">
    <!-- <a href="">{{item}}</a> -->
     <router-link :to="{ name: 'ResumeDetail', params: { id: resume.id }}">{{resume.name}}</router-link>
  </li>
</ul>
</template>

<script>
import { fetchResumeList } from "@/helpers/resumeFetch";
export default {
  name: "ResumeList",
  data() {
    return {
      resumes: []
    };
  },

  methods: {
    async fetchResumes () {
      let result = await fetchResumeList();
      this.resumes = result.data
    }
  },
  mounted () {
    this.fetchResumes();
    // console.log(this.list);

  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
