const { environment } = require('@rails/webpacker')
const UglifyPlugin = require('uglifyjs-webpack-plugin')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
environment.plugins.set('UglifyJs', new UglifyPlugin())
environment.plugins = environment.plugins
.map(plug => {
  if (plug instanceof webpack.optimize.UglifyJsPlugin) {
    return new webpack.optimize.UglifyJsPlugin({
      sourceMap: false,
      parallel: true,
      mangle: false,
      uglifyOptions: {
        mangle: false
      },
      compress: {
        warnings: false
      },
      output: {
        comments: false
      }
    });
  }
  return plug;
})
module.exports = environment
