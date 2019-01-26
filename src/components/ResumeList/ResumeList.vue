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

        <div>
            <b-dropdown size=sm>
                <star-rating v-bind:max-rating="5" v-bind:star-size="25" v-bind:rounded-corners=true v-bind:show-rating=false v-bind:padding="8" @rating-selected="filtByStar"></star-rating>
                <b-list-group style="padding-top:56px" v-for="(tag, $key) in tags" :key="$key" v-on:click="filtByTag(tag)">
                    {{tag.content}}
                </b-list-group>
                <b-button v-on:click="clearFilters">clear</b-button>
            </b-dropdown>
        </div>

        <div>
            <div v-for="resume in resumes" :key="resume.id">
                <div class="resume" @click="goResume(resume.id)">
                    <div style="float: right">
                        <star-rating v-bind:max-rating="5"
                                v-model="resume.star"
                                v-bind:star-size="15"
                                v-bind:show-rating=false>
                        </star-rating>
                    </div>

                    <div class="name">{{resume.name}}</div>
                    <div class="position" style="color: gray">{{resume.work[0].position}}</div>
                    <div>
                        <span class="location-icon" style="font-size: 1.2rem;"><font-awesome-icon icon="map-marker-alt" /></span>
                        <span class="location" style="font-size: 1rem; color: gray">{{resume.city}}</span>
                    </div>
                    <div style="margin: 0.5rem 0" class="inline-gap"></div>
                    <div>
                        <span style="margin-right: 0.5rem;" sm v-for="(skill, $key) in resume.skills" :key="$key">
                            <b-badge variant="info">{{skill.name}}</b-badge>
                        </span>
                    </div>

                    <!--<div>{{resume.star}}</div>

                    {{resume.label}}

                    <b-col lg="2">{{resume.summary}}</b-col>-->
                </div>

                <div class="gap"></div>
            </div>
        </div>

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

        goResume(resumeId) {
            this.$router.push({ path: `/resume/${resumeId}` })
        }
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

.resume {
    padding: 1rem 2rem;
}

.resume .name {
    font-size: 1.2rem;
}

.inline-gap {
    height: 1px;
    width: 100%;
    background-color: #f4f4f4;
}

.gap {
    height: 5px;
    width: 100%;
    background-color: #f4f4f4;
}

.limit-3-line {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
}

</style>
