const { defineConfig } = require("cypress");

module.exports = defineConfig({
  port: 8080,
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    baseUrl: "https://api.github.com/repos/lauraFCa/api-testing",
  },
  env:{
    GITHUB_TOKEN: ""
  }
});
