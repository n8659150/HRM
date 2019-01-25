<template>
    <div>
        <fixed-header :fixed.sync="isFixed" :threshold="1">
            <nav class="navbar" :class="{ 'is-light': isFixed, 'is-primary': !isFixed }">
                <div class="container">
                    <div class="navbar-brand">
                        <span class="navbar-item">
                            Header Content
                        </span>
                        <b-dropdown size=sm>
                            <star-rating v-bind:max-rating="5" v-bind:star-size="25" v-bind:rounded-corners=true v-bind:show-rating=false v-bind:padding="8" @rating-selected="filterByStar"></star-rating>
                        </b-dropdown>
                    </div>
                </div>
            </nav>
        </fixed-header>
        <b-list-group style="padding-top:56px">
            <b-list-group-item variant="light" v-for="resume in resumes" :key="resume.id">
                <b-container class="bv-example-row">
                    <b-row>
                        <b-col cols="9">
                            <router-link :to="{ name: 'ResumeDetail', params: { id: resume.id }}">
                                {{resume.name}}
                            </router-link>
                        </b-col>
                        <b-col cols="1">
                            <b-badge variant="info" pill> {{resume.star}} stars</b-badge>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col>
                            <b-img style="width:1rem; height: 70%" v-bind:src="images.mapFlag" fluid /> {{resume.city}}
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col>{{resume.label}}</b-col>
                    </b-row>
                    <b-row>
                        <b-col lg="2">{{resume.summary}}</b-col>
                    </b-row>
                    <b-row>
                        <b-col sm v-for="(skill, $key) in resume.skills" :key="$key" cols="3">
                            <b-badge variant="secondary">{{skill.name}}</b-badge>
                        </b-col>
                    </b-row>
                </b-container>
            </b-list-group-item>
        </b-list-group>
    </div>
</template>

<script>
import FixedHeader from "vue-fixed-header";
import StarRating from "vue-star-rating";
import { fetchResumeList, fetchStarsByResumeId } from "@/helpers/data";
import store from "@/helpers/store";
import mapFlag from "@/assets/maps-and-flags.png";
export default {
    name: "ResumeList",
    components: {
        FixedHeader,
        StarRating
    },
    data() {
        return {
            resumes: [],
            images: { mapFlag },
            isFixed: false
        };
    },

    methods: {
        async fetchResumes() {
            let result = await fetchResumeList();
            store.save("cachedResumes", result.data);
            this.resumes = result.data;
        },
        filterByStar() {}
    },

    mounted() {
        this.fetchResumes();
    }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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
}
.navbar.is-primary {
    background: green;
}
.navbar.is-light {
    background: blue;
}
</style>
