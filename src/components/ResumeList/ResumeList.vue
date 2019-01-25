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
                        <b-badge variant="info" pill> {{resume.star}} stars</b-badge>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col>
                        <b-img style="width:1rem; height: 70%" v-bind:src="images.mapFlag" fluid />
                        {{resume.city}}
                    </b-col>
                </b-row>
                <b-row>
                    <b-col>{{resume.label}}</b-col>
                </b-row>
                <b-row>
                    <b-col lg="2">{{resume.summary}}</b-col>
                </b-row>
                <b-row>
                    <b-col sm v-for="skill in resume.skills" cols="3"><b-badge variant="secondary">{{skill.name}}</b-badge></b-col>
                </b-row>
            </b-container>
        </b-list-group-item>
    </b-list-group>
</div>
</template>

<script>
import { fetchResumeList, fetchStarsByResumeId } from "@/helpers/data";
import store from "@/helpers/store";
import mapFlag from "@/assets/maps-and-flags.png";
export default {
  name: "ResumeList",
  data() {
    return {
      resumes: [],
      images: { mapFlag }
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
