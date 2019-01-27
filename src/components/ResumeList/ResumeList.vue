<template>
    <div class="resume-list">
        <div class="filter">
            <h5>Filter by</h5>
            <div>
            <div style="margin: 0 2rem 0 0; font-size: 0.9rem; color: gray"><span>Star: </span></div>
            <div style="">
                <star-rating v-model="currentRating" v-bind:max-rating="5" v-bind:star-size="25"
                        v-bind:show-rating=false
                        v-bind:padding="8"
                        @rating-selected="filtByStar">
                </star-rating>
            </div>
            </div>

            <div style="margin-top: 0.5rem;">
                <div style="margin: 0 2rem 0 0; font-size: 0.9rem; color: gray"><span>Tag: </span></div>
                <div style=""><b-form-select v-model="tagFilter" v-on:change="filtByTag(tagFilter)">
                    <option v-bind:value="tag.id" v-for="tag in tags">{{ tag.content }}</option>
                </b-form-select>
                </div>
            </div>

            <div style="margin-top: 1rem;">
                <b-button size="sm" v-on:click="clearFilters">clear</b-button>
            </div>
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
                        <span class="location-icon" style="font-size: 1.3rem;">
                            <i class="fa fa-map-marker" aria-hidden="true"></i></span>
                        <span class="location" style="font-size: 1rem; color: gray">{{resume.city}}</span>
                    </div>
                    <div style="margin: 0.5rem 0" class="inline-gap"></div>
                    <div>
                        <span style="margin-right: 0.5rem;" sm v-for="(skill, $key) in resume.skills" :key="$key">
                            <b-badge variant="info">{{skill.name}}</b-badge>
                        </span>
                    </div>
                </div>

                <div class="gap"></div>
            </div>
        </div>

    </div>
</template>

<script>
import FixedHeader from "vue-fixed-header";
import StarRating from "vue-star-rating";
import { fetchResumeList, fetchStarsByResumeId, fetchAllTags, addNewTag, deleteTag, addNewHighlight, deleteHighlight, fetchAllHighlights, updateResume } from "@/helpers/data";
import store from "@/helpers/store";
export default {
    name: "ResumeList",
    components: {
        FixedHeader,
        StarRating
    },
    data() {
        return {
            resumes: [],
            isFixed: false,
            tags: [],
            newTagContent: "",
            newHighlight: "",
            highlights: [],
            tagFilter: 0,
            currentRating: 0
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
        async filtByTag(tagId) {
            this.resumes = store.fetch("cachedResumes");
            this.resumes = this.resumes.filter( resume => {
                let found = resume.tags.find( tagID => {
                    return tagID == tagId;
                })
                return found ? true : false;
            });
        },
        clearFilters() {
           this.resumes = store.fetch("cachedResumes");
           this.currentRating = 0;
           this.tagFilter = 0;
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
            await deleteTag(tagid);
            this.resumes = this.resumes.forEach(async (resume) => {
                if (resume.tags) {
                    let tagFound = resume.tags.find(tagID => {
                        return tagID == tagid;
                    })
                    if (tagFound) {
                        resume.tags = resume.tags.filter(tagID => {
                            return tagID !== tagid;
                        })
                        await updateResume(resume);
                    }
                }
            })
            await updateResume(this.resumes);
            store.save("cachedResumes", this.resumes);
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
        this.$root.eventHub.$on('synctags',(updatedTags)=> {
            this.tags = updatedTags;
        });
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
    padding: 1rem 1rem;
}

.filter {
    background-color: #f4f4f4;
    padding: 1rem 1rem;
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

.resume-list {
    padding-top: 2.5rem;
}

</style>
