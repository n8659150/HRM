<template>
<div class="user-setting">
    <b-input-group>
        <b-form-input placeholder="Add a Tag Here" v-model="newTagContent"></b-form-input>
        <b-input-group-append>
            <b-btn variant="secondary" v-on:click="addNewTag(newTagContent)">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </b-btn>
        </b-input-group-append>
    </b-input-group>

    <div class="tag-list">
        <span style="margin-right: 0.5rem" v-for="tag in tags">

        <b-badge variant="warning" size="default" >
          <span style="margin-right: 0.3rem"><i class="fa fa-tag" aria-hidden="true"></i></span>{{tag.content}}
          <span class="inline-block" style="margin-left: 0.5rem;" v-on:click="deleteTag(tag.id)">
            <i class="fa fa-remove" aria-hidden="true"></i>
          </span>
        </b-badge>

        </span>
    </div>

    <b-input-group>
        <b-form-input placeholder="Add a Highlight Here" v-model="newHighlight"></b-form-input>
        <b-input-group-append>
            <b-btn variant="secondary" v-on:click="addNewHighlight(newHighlight)">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </b-btn>
        </b-input-group-append>
    </b-input-group>

    <div class="tag-list">
        <span style="margin-right: 0.5rem" v-for="highlight in highlights">

        <b-badge variant="warning" size="default" >
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
    fetchAllHighlights,
    updateResume
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
            this.$root.eventHub.$emit('synctags', this.tags);
        },
        async deleteTag(tagid) {
            await deleteTag(tagid);
            let resumes = store.fetch("cachedResumes");
            resumes = resumes.forEach(async (resume) => {
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
            store.save("cachedResumes", resumes);
            await this.getAllTags();
            this.$root.eventHub.$emit('synctags', this.tags);
        },
        async addNewHighlight() {
            await addNewHighlight(this.newHighlight);
            await this.getAllHighlights();
            this.newHighlight = "";
            this.$root.eventHub.$emit('synchighlights', this.highlights);
        },
        async deleteHighlight(highlightid) {
            await deleteHighlight(highlightid);
            await this.getAllHighlights();
            this.$root.eventHub.$emit('synchighlights', this.highlights);
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
    height: 100%;
    background-color: #f4f4f4;
    padding: 1rem 1rem;
    z-index: 1;
}
.tag-list {
  margin: 0 0 1rem 0;
}
.input {}

.badge-warning {
    color: #565555;
}

.inline-block {
    display: inline-block;
}
</style>
