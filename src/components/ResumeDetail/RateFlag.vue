<template>
    <div class="rate-flag">

        <!-- <div class="bv-example-row" style="background-color: #5c5959;"> -->
            <div class="bv-example-row">
            <b-row>
                <b-col cols="10">
                    <star-rating v-bind:max-rating="5" v-model="resume.star" v-bind:star-size="30" v-bind:show-rating=false @rating-selected="updateResumeStar" v-bind:rounded-corners=true border-color="#ff1010" v-bind:border-width=1></star-rating>
                </b-col>
                <b-col cols="1">
                    <b-dropdown dropup right variant="secondary" size="sm">
                        <b-dropdown-item v-for="(tag, $key) in tags" :key="$key" v-on:click="addTag(tag)">{{tag.content}}</b-dropdown-item>
                    </b-dropdown>
                </b-col>
            </b-row>

    <div>
        <div style="margin-top: 1rem;">
            <b-button-toolbar>
                <b-badge style="margin-right: 0.5rem" variant="warning" v-for="(tag, $key) in tagsAttached" :key="$key">{{tag.content}} <b-btn size=sm v-on:click="removeTag(tag)">x</b-btn></b-badge>
            </b-button-toolbar>
        </div>
    </div>

        </div>

    </div>
</template>

<script>
import { fetchResumeList, updateResume, fetchAllTags } from "@/helpers/data";
import StarRating from "vue-star-rating";
import store from "@/helpers/store";

export default {
    name: "RateFlag",
    components: { StarRating },
    props: ["resume"],
    computed: {},
    methods: {
        async updateResumeStar(rating) {
            this.resume.star = rating;
            await updateResume(this.resume);
        },
        async getAllTags() {
            this.tags = store.fetch("cachedTags");
        },
        async addTag(tag) {
            let tagID = this.resume.tags.find(tagID => {
                return tagID == tag.id;
            });
            if (!tagID) {
                this.resume.tags.push(tag.id);
                await updateResume(this.resume);
                await this.getAttachedTags();
            }
        },
        async getAttachedTags() {
            this.tagsAttached = [];
            this.resume.tags.forEach(tagID => {
                let tag = this.tags.find(tag => {
                    return tag.id === tagID;
                });
                let existed = this.tagsAttached.find(tag => {
                    return tag.id === tagID;
                });
                if (tag && !existed) {
                    this.tagsAttached.push(tag);
                }
            });
        },
        async removeTag(tag) {
            this.resume.tags = this.resume.tags.filter(tagID => {
                return tagID !== tag.id;
            });
            await updateResume(this.resume);
            await this.getAttachedTags();
        }
    },
    data() {
        return {
            tags: [],
            tagsAttached: []
        };
    },

    async mounted() {
        await this.getAllTags();
        await this.getAttachedTags();
    }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.rate-flag {
    padding: 0.5rem;
    color: white;
  }
</style>
