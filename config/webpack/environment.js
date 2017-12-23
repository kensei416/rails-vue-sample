const { environment } = require('@rails/webpacker')
const UglifyPlugin = require('uglifyjs-webpack-plugin')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
environment.plugins.set('UglifyJs', new UglifyPlugin())
module.exports = environment
