<template>
  <div class="rate-flag">
    <star-rating
      v-bind:max-rating="5"
      v-model="resume.star"
      v-bind:star-size="30"
      v-bind:show-rating="false"
      @rating-selected="updateResumeStar"
      v-bind:rounded-corners="true"
      border-color="#ff1010"
      v-bind:border-width="1"
    ></star-rating>

    <div class="space-between" style="margin-top: 1rem;">
      <div>
        <b-badge
          class="tag"
          variant="warning"
          size="default"
          v-for="(tag, $key) in tagsAttached"
          :key="$key"
        >
          <span style="margin-right: 0.3rem">
            <i class="fa fa-tag" aria-hidden="true"></i>
          </span>
          {{tag.content}}
          <span
            class="inline-block"
            style="margin-left: 0.5rem;"
            v-on:click="removeTag(tag)"
          >
            <i class="fa fa-remove" aria-hidden="true"></i>
          </span>
        </b-badge>
      </div>

      <div class="add-tag">
        <b-dropdown dropup right variant="secondary" size="sm">
          <b-dropdown-item
            v-for="(tag, $key) in tags"
            :key="$key"
            v-on:click="addTag(tag)"
          >{{tag.content}}</b-dropdown-item>
        </b-dropdown>
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
  watch: {
    resume: async function() {
      await this.getAttachedTags();
    }
  },
  async mounted() {
    await this.getAllTags();
    await this.getAttachedTags();
    this.$root.eventHub.$on("synctags", updatedTags => {
      this.tags = updatedTags;
    });
  }
};
</script>

<style scoped>
.rate-flag {
  padding: 0.5rem 0.5rem 0 0.5rem;
  color: white;
  background-color: #7d7c7c;
  /*background-color:#f4f4f4;*/
}

.tag {
  margin: 0rem 0.8rem 0.8rem 0;
}

.add-tag {
  width: 2rem;
}

.inline-block {
  display: inline-block;
}
</style>
