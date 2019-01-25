<template>
  <div>
<cube-scroll
  ref="scroll"
  :data="resumeList"
  direction="horizontal"
  class="horizontal-scroll-list-wrap">
  <ul class="list-wrapper">
    <li v-for="resume in resumeList" :key="resume.id" class="list-item" >
        
        <router-link :to="{ name: 'ResumeDetail', params: { id: resume.id }}">
            <div style="text-align:center;">
                <p class="see-also-title">{{resume.name}}</p>
                <b-badge :variant="getBadgeColor" pill :id="resume.id">{{resume.skills[0].name}}</b-badge>
            </div>
        </router-link>
    </li>
  </ul>
</cube-scroll>
  </div>

</template>

<script>
import { fetchResumeList } from "@/helpers/resumeFetch";
export default {
    name: "SeeAlso",
    computed: {
        getBadgeColor() {
            let collections = ['primary','secondary','success','danger','warning','info','light','dark'];
            let index = Math.floor(Math.random()* 8);
            return collections[index]
            
        }
    },
    data() {
        return {
            resumes: []
        };
    },
    props: ["resumeList"],

    mounted() {
    }
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
    white-space: nowrap
  .list-item
    display: inline-block
    padding: 8px
.see-also-title
    margin-bottom: 8px
</style>