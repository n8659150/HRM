<template>
  <div class="rate-flag">

<b-container class="bv-example-row">
    <b-row>
        <b-col cols="10">
            <star-rating v-bind:max-rating="5" v-model="resume.star" v-bind:star-size="30" @rating-selected="updateResumeStar" v-bind:rounded-corners=true border-color="#ff1010" v-bind:border-width=1></star-rating>
        </b-col>
        <b-col cols="1">
            <b-dropdown dropup right variant="secondary" size="sm">
                <b-dropdown-item v-for="tag in tags" v-on:click="addTag(tag)">{{tag.content}}</b-dropdown-item>
            </b-dropdown>
        </b-col>
    </b-row>
    <b-row>
        <b-col v-for="tag in tagsAttached" cols="4">{{tag.content}}</b-col>
    </b-row>
</b-container>

  </div>
</template>

<script>
import { fetchResumeList, updateResume, fetchAllTags } from "@/helpers/data";
import StarRating from 'vue-star-rating'
export default {
    name: "RateFlag",
    components: { StarRating },
    props: ["resume"],
    computed: {
    },
    methods: {
        async updateResumeStar(rating) {
            this.resume.star = rating;
            await updateResume(this.resume);
        },
        async getAllTags() {
             let result = await fetchAllTags();
             this.tags = result.data;
        },
        async addTag(tag) {
            let tagID = this.resume.tags.find( tagID => {
                return tagID == tag.id;
            })
            if (!tagID) {
                this.resume.tags.push(tag.id);
                await updateResume(this.resume);
                await this.getAttachedTags();
            }
        },
        async getAttachedTags() {
            this.resume.tags.forEach(tagID => {
                let tag = this.tags.find(tag => {
                    return tag.id === tagID;
                })
                let existed = this.tagsAttached.find(tag => {
                    return tag.id === tagID;
                })
                if (tag && !existed) {
                    this.tagsAttached.push(tag);
                }
            });
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
<style>
.rate-flag {
    /* background-color: #a5a3a3ed; */
  }
</style>
