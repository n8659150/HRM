<template>
  <div>
    <star-rating v-bind:max-rating="5" v-model="resume.star" v-bind:star-size="30" @rating-selected="updateResumeStar"></star-rating>
  </div>
</template>

<script>
import { fetchResumeList, updateResumeStar } from "@/helpers/data";
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
            await updateResumeStar(this.resume, rating);
        }
    },
    data() {
        return {
        };
    },

    mounted() {
    }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
</style>
