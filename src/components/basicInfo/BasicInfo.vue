<template>

    <div class="basic-info">
        <div style="display: flex; justify-content: space-start; align-items: flex-end">
            <div style="margin: 0.1rem 3rem 0 0; height: 5rem">
                <b-img style="height: 4.8rem" v-bind:src="resume.avatar" rounded fluid />
            </div>
            <div style="height: 5rem">
                <span style="font-size: 1.5rem; display: block">{{ resume.name }}</span>
                <span style="display: block; margin-top: -0.2rem;">Font End Developer</span>

                <div style="display:flex; align-items: base-line; margin: 0.3rem 0 0 -0.2rem">
                    <b-img style="width:1rem; height: 90%" v-bind:src="images.mapFlag" fluid />
                    <span style="font-size: 0.8rem;">{{ resume.city }}</span>
                </div>
            </div>

        </div>

        <div style="font-size: 0.8rem; margin-top: 15px">
            <span>{{ resume.summary }}</span>
        </div>

    </div>

</template>

<script>
import mapFlag from "@/assets/maps-and-flags.png";

export default {
    name: "BasicInfo",
    props: ["resume"],
    data() {
        return {
            images: { mapFlag }
        };
    },
    methods: {}
};
</script>

<style scoped>
.basic-info {
    background-color: white;
    padding: 1rem 0 1rem 0;
}
</style>
