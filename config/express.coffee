express = require 'express'
mongoStore = require('connect-mongo')(express)
flash = require 'connect-flash'
pkg = require('../package.json')

module.exports = (app, config) ->
  app.set 'showStackError', true
  
  app.use express.compress(
    filter: (req, res) ->
      /json|text|javascript|css/.test res.getHeader('Content-Type')
    level: 9
  )
  
  app.use express.favicon()
  app.use express.static(config.root + '/public')
  app.use express.logger 'dev'
  
  app.set 'views', config.root + '/app/views'
  app.set 'view engine', 'jade'
  app.locals.basedir = config.root + '/app/views'
  
  app.configure ->
    app.use (req, res, next) ->
      res.locals.pkg = pkg 
      next()
  
  app.use express.cookieParser()
  app.use express.bodyParser()
  app.use express.methodOverride()
  
  # express/mongo session stroage
  app.use express.session(
    secret: 'osl-admin'
    store: new mongoStore(
      url: config.db
      collection: 'sessions'
    )
  )
  
  app.use flash()
  
  app.use express.csrf()
  # app.use (req, res, next) ->
  #   res.locals.csrf_token = req.session._csrf
  #   next()
  
  app.use app.router
  
  app.use (err, req, res, next) ->
    #treat as 404
    if err.message and (~err.message.indexOf('not found') or (~err.message.indexOf('Cast to ObjectId failed')))
      next()
    
    console.error err.stack
    
    res.status(500).render '500',
      error: err.stack
    
    app.use (req, res, next) ->
      res.status(404).render '404',
        url: req.originalUrl
        error: 'Not found'
  
  app.configure 'development', ->
    app.locals.pretty = true

  