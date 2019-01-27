<template>
    <div class="skills">
      <div>
        <h5 class="block-title">Skills</h5>
      </div>

      <div class="skill-blocks">
        <div v-for="(skill, $key) in skills" :key="$key">
          <div class="skill">
            <span><img v-bind:src="getIcon(skill.name)"></span>
            <span class="inline-block">{{ skill.name }}</span>
          </div>
          <div class="level-block">
            <div class="dot_1 level" style="background-color: #ff0058;"></div>
            <div class="dot_2 level" v-bind:class="{ 'level-on': skill.level === 'Master' || skill.level === 'Professinal' }"></div>
            <div class="dot_3 level" v-bind:class="{ 'level-on': skill.level === 'Master' }"></div>
          </div>
        </div>
      </div>

    </div>

</template>

<script>
export default {
    name: "Skills",
    props: ["skills"],
    data() {
        return {
          icons:{
            'angular':require('@/assets/angular.png'),
            'react':require('@/assets/react.png'),
            'nodejs':require('@/assets/nodejs.png'),
            'sketch':require('@/assets/sketch.png'),
            'adobe':require('@/assets/adobe.png'),
            'vue':require('@/assets/vue.png'),
            'python':require('@/assets/python.png'),
            'ruby':require('@/assets/ruby.png'),
            'photoshop':require('@/assets/photoshop.png')
          }
          };
    },
    methods: {
      getLevel(level) {
        if (level.toLocaleLowerCase() === "master") {
          return "M";
        }
        if (level.toLocaleLowerCase() === "amateur") {
          return "A";
        }
      },

      getIcon(skill) {
        skill = skill.toLocaleLowerCase();
        if (skill === "angular") {
          return this.icons.angular;
        }
        if (skill === "react") {
          return this.icons.react;
        }
        if (skill === "nodejs") {
          return this.icons.nodejs;
        }
        if (skill === "sketch") {
          return this.icons.sketch;
        }
        if (skill.indexOf("adobe") !== -1) {
          return this.icons.adobe;
        }
        if (skill === "vue") {
          return this.icons.vue;
        }
        if (skill === "python") {
          return this.icons.python;
        }
        if (skill === "ruby") {
          return this.icons.ruby;
        }
        if (skill == "photoshop") {
          return this.icons.photoshop;
        }
      }
    }
};
</script>

<style scoped>
.skills {
    padding: 1em 0 1em 0;
}

.skill-blocks {
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
}

.skill {
  width: 5rem;
  height: 5rem;
  text-align: center;
  background-color: #f4f4f4;
  border-radius: 4px;

  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  margin-bottom: 0.5rem;
  margin-right: 0.3rem;
}

.skill img {
  height: 2rem;
  margin-bottom: 0.2rem;
}

.level-block {
  width: 5rem;
  display: flex;
  justify-content: center;
  margin: 0.2rem 0 1rem 0;
}

.level-block .level {
  display: inline-block;
  width: 0.5rem;
  height: 0.5rem;
  border-radius: 0.25rem;
  background-color: #f4f4f4;;
  margin-right: 0.5rem;
}

.level-on {
  background-color: #ff0058 !important;
}

.inline-block {
  display: inline-block;
}

</style>
