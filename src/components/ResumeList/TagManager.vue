<template>
<b-dropdown size=sm>
    <b-button-toolbar>
        <b-form-input style="width: 60%" placeholder="input your tag here" v-model="newTagContent"></b-form-input>
        <b-btn size=sm v-on:click="addNewTag(newTagContent)">S</b-btn>
        <b-btn size=sm v-on:click="clearNewTag()">C</b-btn>
    </b-button-toolbar>
    <b-list-group v-for="tag in tags">
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
    <b-list-group v-for="highlight in highlights">
        <b-button-toolbar>
            {{highlight.content}}
            <b-btn size=sm v-on:click="deleteHighlight(highlight.id)">x</b-btn>
        </b-button-toolbar>
    </b-list-group>
</b-dropdown>
</template>

<script>
import { fetchResumeList, fetchStarsByResumeId, fetchAllTags, addNewTag, deleteTag, addNewHighlight, deleteHighlight, fetchAllHighlights } from "@/helpers/data";

export default {
    name: "TagManager",
    components: {},
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
    }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>

</style>
