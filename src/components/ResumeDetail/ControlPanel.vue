<template>
<div class="control-panel">
    <RateFlag :resume="resume"></RateFlag>
    <SeeAlso :resumeList="resumeList"></SeeAlso>
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
        return {};
    },
};
</script>

<style>
    .control-panel {
        /* background-color: #5c5959; */
        background-color: #5c5959db;
        position: fixed;
        width: 100%;
        bottom: 0;
    }
</style>
