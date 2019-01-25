<template>
<div class="experience">
    <div>
        <h5>Experience</h5>
        <div v-for="experience in resume.work">
            <div class="experience-block">
                <div>{{ experience.position }}</div>
                <div>{{ experience.company }}</div>
                <div class="date">
                    <span>{{ experience.startDate | moment("MMMM YYYY") }}</span>
                    <span>-</span>
                    <span>{{ experience.endDate | moment("MMMM YYYY") }}</span>
                </div>
                <div>
                    <text-highlight :queries="queries">{{ experience.summary }}</text-highlight>
                </div>
            </div>
            <div class="gap"></div>
        </div>
    </div>
</div>
</template>

<script>
export default {
    name: "Experience",
    props: ["resume"],
    data() {
        return {
            queries:['angular','Angular','React','react','Vue','vue','JavaScript','javascript']
        };
    },
    methods: {}
};
</script>

<style scoped>
.experience {
    padding: 1rem 0 0rem 0;
}

.experience-block {
    margin: 0rem 0 0rem 0rem;
    padding: 1rem 0 1rem 0;
}

.date {
  margin-top: 0.3rem;
  font-size: 0.8rem;
  color: gray;
}

</style>
