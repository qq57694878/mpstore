<template>
  <div>
    <basic-container class="guide-container">
      <el-button icon='el-icon-question'
                 type="primary"
                 @click="guide">运行引导页</el-button>

      <editor id="editor_id" height="500px"

              pluginsPath="/static/kindeditor/plugins/"
              :loadStyleMode="false"
              ></editor>

    </basic-container>
  </div>
</template>

<script>
import * as Driver from "driver.js"; // import driver.js
import "driver.js/dist/driver.min.css"; // import driver.js css
import steps from "./defineSteps";

export default {
  name: "guide",
  data () {
    return {

    };
  },
  mounted () {
    this.driver = new Driver();
  },
  methods: {
    guide () {
      this.driver.defineSteps(steps);
      this.driver.start();
    },
  }
};
</script>
