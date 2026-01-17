const { defineConfig } = require("cypress");

module.exports = defineConfig({
  projectId: 'api',
 reporter: 'mochawesome',
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    baseUrl: "https://api.github.com/repos/lauraFCa/api-testing",
  }
});
