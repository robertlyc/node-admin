# load contorllers

# expose routes

module.exports = (app) ->
  app.get('/', (req, res) ->
    res.render 'index',
      title: 'OSL Admin'
  )