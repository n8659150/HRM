<template>
    <div class="education">
        <div>
            <h5>Education</h5>
            <div v-for="(education, $key) in resume.education" :key="$key">
                <div class="education-block">
                    <div>{{ education.institution }}</div>
                    <div>{{ education.area }}</div>
                    <div>{{ education.studyType }}</div>
                    <div class="date">
                        <span>{{ education.startDate | moment("MMMM YYYY") }}</span>
                        <span>-</span>
                        <span>{{ education.endDate | moment("MMMM YYYY") }}</span>
                    </div>
                </div>

                <div class="gap"></div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Education",
    props: ["resume"],
    data() {
        return {};
    },
    methods: {}
};
</script>

<style scoped>
.education {
    padding: 1rem 0 0rem 0;
}

.experience-block {
    margin: 0rem 0 0rem 1rem;
    padding: 1rem 0 1rem 0;
}

.date {
    margin-top: 0.3rem;
    font-size: 0.8rem;
    color: gray;
}

.gap {
    height: 2px;
    width: 100%;
    background-color: #f4f4f4;
}

</style>
