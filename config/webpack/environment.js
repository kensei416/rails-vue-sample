const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
environment.loaders.get('vue').options.extractCSS = false
module.exports = environment
