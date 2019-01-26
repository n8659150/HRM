<template>
<div class="user-setting">
    <b-input-group size="sm">
        <b-form-input placeholder="Add a Tag Here" v-model="newTagContent"></b-form-input>
        <b-input-group-append>
            <b-btn size=sm variant="info" v-on:click="addNewTag(newTagContent)">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </b-btn>
        </b-input-group-append>
    </b-input-group>

    <div class="tag-list">
        <span style="margin-right: 0.5rem" v-for="tag in tags">

        <b-badge variant="info" size="default" >
          <span style="margin-right: 0.3rem"><i class="fa fa-tag" aria-hidden="true"></i></span>{{tag.content}}
          <span class="inline-block" style="margin-left: 0.5rem;" v-on:click="deleteTag(tag.id)">
            <i class="fa fa-remove" aria-hidden="true"></i>
          </span>
        </b-badge>

        </span>
    </div>

    <b-input-group size="sm">
        <b-form-input placeholder="Add a Highlight Here" v-model="newHighlight"></b-form-input>
        <b-input-group-append>
            <b-btn size=sm variant="info" v-on:click="addNewHighlight(newHighlight)">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </b-btn>
        </b-input-group-append>
    </b-input-group>

    <div class="tag-list">
        <span style="margin-right: 0.5rem" v-for="highlight in highlights">

        <b-badge variant="info" size="default" >
          {{ highlight.content }}
          <span class="inline-block" style="margin-left: 0.5rem;" v-on:click="deleteHighlight(highlight.id)">
            <i class="fa fa-remove" aria-hidden="true"></i>
          </span>
        </b-badge>

        </span>
    </div>
</div>
</template>

<script>
import {
    fetchResumeList,
    fetchStarsByResumeId,
    fetchAllTags,
    addNewTag,
    deleteTag,
    addNewHighlight,
    deleteHighlight,
    fetchAllHighlights
} from "@/helpers/data";

import store from "@/helpers/store";

export default {
    name: "UserSetting",
    components: {
    },
    data() {
        return {
            tags: [],
            newTagContent: "",
            newHighlight: "",
            highlights: []
        }
    },
    methods: {
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
    },

    beforeCreate() {
        this.$nextTick(function () {
            console.log("sssss");
            this.getAllTags();
            this.getAllHighlights();
        })
    },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
.user-setting {
    position: fixed;
    top: 2.5rem;
    width: 100%;
    height: 15rem;
    background-color: #f4f4f4;
    padding: 1rem 2rem;
}
.tag-list {
  margin: 0 0 1rem 0;
}
.input {}

.inline-block {
    display: inline-block;
}
</style>
