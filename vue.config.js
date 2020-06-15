var settings = require('./src/settings')

module.exports = {
  chainWebpack: (config) => {
    config
      .plugin('html')
      .tap((args) => {
        args[0].title = settings.title;
        return args;
      });
  },
  "transpileDependencies": [
    "vuetify"
  ]
}