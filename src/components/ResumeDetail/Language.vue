<template>
    <div class="language">
      <div>
        <h5 class="block-title">Language</h5>
      </div>

      <div class="cycle-panel">
        <div v-for="(language, $key) in languages" :key="$key">
          <div class="cycle" v-bind:class="{'cycle-75': language.fluency === 'Native speaker'}">
          </div>
          <div class="cycle-language"><span>{{ language.language }}</span></div>
          <div class="cycle-fluency">{{ language.fluency }}</div>
        </div>
      </div>
    </div>

</template>

<script>
export default {
    name: "Language",
    props: ["languages"],
    data() {
        return {};
    },
    methods: {
    }
};
</script>

<style scoped>
.language {
    padding: 1em 0 1em 0;
}

.cycle span {
  height: 100%;
  line-height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.cycle-panel {
    position: relative;
    width: 100%;
    height: 6.5rem;
    overflow: hidden;
    margin-top: 0.5rem;
}

.cycle {
    width: 5rem;
    height: 5rem;
    border: 4px solid transparent;
    border-radius: 50%;
    position: absolute;
    border-left: 4px solid #ff0058;
    border-right: 4px solid #ff0058;
    border-top: 4px solid #ff0058;
    border-bottom: 4px solid #ff0058;
    -webkit-transform : rotate(45deg);
    -moz-transform : rotate(45deg);
    -o-transform : rotate(45deg);
    transform : rotate(45deg);
}

.cycle-75 {
  border-top: 4px solid #d2d3d4 !important;
}

.cycle-language {
  text-align: center;
  line-height: 5rem;
  width: 5rem;
}

.cycle-fluency {
  text-align: center;
  width: 5rem;
  font-size: 0.6rem;
  color: #8c8e90;
  margin-top: 0.3rem;
}

</style>
