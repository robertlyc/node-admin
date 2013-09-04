express = require 'express'
fs = require 'fs'

env = process.env.NODE_ENV || 'development'
config = require('./config/config')[env]
mongoose = require 'mongoose'

# db connection
mongoose.connect config.db

#models
models_path = __dirname + '/app/models'
fs.readdirSync(models_path).forEach (file) ->
  require(models_path + '/' + file) if ~file.indexOf('.coffee')

#express
app = express()
require('./config/express')(app,config)

#routes
require('./config/routes')(app)

port = process.env.PORT || 3000
app.listen port
console.log ('Express app started on port ' + port)

exports = module.exports = app