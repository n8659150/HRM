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
import store from "@/helpers/store";
export default {
  name: "ResumeList",
  data() {
    return {
      resumes: []
    };
  },

  methods: {
    async fetchResumes() {
      let result = await fetchResumeList();
      store.save('cachedResumes', result.data);
      this.resumes = result.data;

    }
  },

  mounted() {
    this.fetchResumes();
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
