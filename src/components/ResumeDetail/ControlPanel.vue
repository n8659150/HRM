<template>
<div class="control-panel">
    <RateFlag :resume="resume"></RateFlag>
    <div class="see-also-button">
        <span @click="showSeeAlso = !showSeeAlso">
            <i class="fa fa-fighter-jet" aria-hidden="true"></i>
        </span>
    </div>
    <SeeAlso v-show="showSeeAlso" :resumeList="resumeList"></SeeAlso>
</div>
</template>

<script>
import SeeAlso from "@/components/SeeAlso/SeeAlso.vue";
import RateFlag from "@/components/ResumeDetail/RateFlag.vue";

export default {
    name: "ControlPanel",
    components: {
        SeeAlso,
        RateFlag
    },
    props: ["resume", "resumeList"],
    computed: {},
    methods: {

    },
    data() {
        return {
            showSeeAlso: false
        };
    },
};
</script>

<style>
    .control-panel {
        /*background-color: #5c5959;*/
        background-color:#7d7c7c;
        position: fixed;
        width: 100%;
        bottom: 0;
    }

    .see-also-button {
        text-align: center;
        color: white;
        font-size: 1.5rem;
        margin-bottom: 0.1rem;
    }

</style>
