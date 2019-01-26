<template>
    <div>
        <nav class="navbar" :class="{ 'is-light': isFixed, 'is-primary': !isFixed }">
            <div class="container">
                <div class="navbar-brand">
                    <b-dropdown size=sm>
                        <star-rating v-bind:max-rating="5" v-bind:star-size="25" v-bind:rounded-corners=true v-bind:show-rating=false v-bind:padding="8" @rating-selected="filtByStar"></star-rating>
                        <b-list-group style="padding-top:5px" v-for="(tag, $key) in tags" v-on:click="filtByTag(tag)" :key="$key">
                            {{tag.content}}
                        </b-list-group>
                        <b-button v-on:click="clearFilters">clear</b-button>
                    </b-dropdown>
                    <b-dropdown size=sm>
                        <b-button-toolbar>
                            <b-form-input style="width: 60%" placeholder="input your tag here" v-model="newTagContent"></b-form-input>
                            <b-btn size=sm v-on:click="addNewTag(newTagContent)">S</b-btn>
                            <b-btn size=sm v-on:click="clearNewTag()">C</b-btn>
                        </b-button-toolbar>
                        <b-list-group v-for="(tag, $key) in tags" :key="$key">
                            <b-button-toolbar>
                                {{tag.content}}
                                <b-btn size=sm v-on:click="deleteTag(tag.id)">x</b-btn>
                            </b-button-toolbar>
                        </b-list-group>
                        <b-button-toolbar>
                            <b-form-input style="width: 60%" placeholder="input your highlights here" v-model="newHighlight"></b-form-input>
                            <b-btn size=sm v-on:click="addNewHighlight(newHighlight)">S</b-btn>
                            <b-btn size=sm v-on:click="clearNewHighlight()">C</b-btn>
                        </b-button-toolbar>
                        <b-list-group v-for="(highlight, $key) in highlights" :key="$key">
                            <b-button-toolbar>
                                {{highlight.content}}
                                <b-btn size=sm v-on:click="deleteHighlight(highlight.id)">x</b-btn>
                            </b-button-toolbar>
                        </b-list-group>
                    </b-dropdown>
                </div>
            </div>
        </nav>
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
import { fetchResumeList, fetchStarsByResumeId, fetchAllTags, addNewTag, deleteTag, addNewHighlight, deleteHighlight, fetchAllHighlights } from "@/helpers/data";
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
            isFixed: false,
            tags: [],
            newTagContent: "",
            newHighlight: "",
            highlights: []
        };
    },

    methods: {
        async fetchResumes() {
            let result = await fetchResumeList();
            store.save("cachedResumes", result.data);
            this.resumes = result.data;
        },
        async filtByStar(star) {
            this.resumes = store.fetch("cachedResumes");
            this.resumes = this.resumes.filter( resume => {
                return resume.star == star;
            });
        },
        async getAllTags() {
            let result = await fetchAllTags();
            store.save("cachedTags", result.data);
            this.tags = result.data;
        },
        async getAllHighlights() {
            let result = await fetchAllHighlights();
            store.save("cachedHighlights", result.data);
            this.highlights = result.data;
        },
        async filtByTag(tag) {
            this.resumes = store.fetch("cachedResumes");
            this.resumes = this.resumes.filter( resume => {
                let found = resume.tags.find( tagID => {
                    return tagID == tag.id;
                })
                return found ? true : false;
            });
        },
        clearFilters() {
           this.resumes = store.fetch("cachedResumes");
        },
        clearNewTag() {
            this.newTagContent = "";
        },
        async addNewTag() {
            await addNewTag(this.newTagContent);
            await this.getAllTags();
            this.newTagContent = "";
        },
        async deleteTag(tagid) {
            // TODO: Delete data in resume accordingly
            await deleteTag(tagid);
            await this.getAllTags();
        },
        async addNewHighlight() {
            await addNewHighlight(this.newHighlight);
            await this.getAllHighlights();
            this.newHighlight = "";
        },
        async deleteHighlight(highlightid) {
            await deleteHighlight(highlightid);
            await this.getAllHighlights();
        },
        clearNewHighlight() {
            this.newHighlight = "";
        },
    },

    async mounted() {
        await this.fetchResumes();
        await this.getAllTags();
        await this.getAllHighlights();
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
