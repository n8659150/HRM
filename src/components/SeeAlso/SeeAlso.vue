<template>
  <div>
    <!-- <ul>
      <li v-for="resume in resumeList" :key="resume.id">
        <router-link :to="{ name: 'ResumeDetail', params: { id: resume.id }}">{{resume.name}}</router-link>
      </li>
    </ul> -->
<cube-scroll
  ref="scroll"
  :data="resumeList"
  direction="horizontal"
  class="horizontal-scroll-list-wrap">
  <ul class="list-wrapper">
    <li v-for="resume in resumeList" :key="resume.id" class="list-item">{{resume}}</li>
  </ul>
</cube-scroll>
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
<style lang="stylus" rel="stylesheet/stylus">
.horizontal-scroll-list-wrap
  border: 1px solid rgba(0, 0, 0, 0.1)
  border-radius: 5px
  .cube-scroll-content
    display: inline-block
  .list-wrapper
    padding: 0 10px
    line-height: 60px
    white-space: nowrap
  .list-item
    display: inline-block
</style>