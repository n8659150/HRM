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
        return {};
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
          return "http://angularjs.org/img/ng-logo.png";
        }
        if (skill === "react") {
          return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1024px-React-icon.svg.png";
        }
        if (skill === "nodejs") {
          return "https://nodejs.org/static/images/logos/nodejs-new-pantone-black.png";
        }
        if (skill === "sketch") {
          return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Sketch_logo_frame.svg/988px-Sketch_logo_frame.svg.png";
        }
        if (skill.indexOf("adobe") !== -1) {
          return "https://upload.wikimedia.org/wikipedia/commons/7/7b/Adobe_Systems_logo_and_wordmark.svg";
        }
        if (skill === "vue") {
          return "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1920px-Vue.js_Logo_2.svg.png";
        }
        if (skill === "python") {
          return "https://www.python.org/static/opengraph-icon-200x200.png";
        }
        if (skill === "ruby") {
          return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/200px-Ruby_logo.svg.png";
        }
        if (skill == "photoshop") {
          return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1920px-Adobe_Photoshop_CC_icon.svg.png";
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
