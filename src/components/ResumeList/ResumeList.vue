<template>
<div>
    <b-list-group>
        <b-list-group-item variant="light" v-for="resume in resumes" :key="resume.id">
            <b-container class="bv-example-row">
                <b-row>
                    <b-col cols="9">
                        <router-link :to="{ name: 'ResumeDetail', params: { id: resume.id }}">
                            {{resume.name}}
                        </router-link></b-col>
                    <b-col cols="1">
                        <b-badge variant="info" pill>viewed</b-badge>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col>{{resume.label}}</b-col>
                </b-row>
                <b-row>
                    <b-col>{{resume.summary}}</b-col>
                </b-row>
            </b-container>
        </b-list-group-item>
    </b-list-group>
</div>
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
