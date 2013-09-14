# load contorllers
location = require '../app/controllers/location'


# expose routes

module.exports = (app) ->
  app.get('/', (req, res) ->
    res.render 'index',
      title: 'OSL Admin'
  )
  
  app.get('/location', location.list)
  # app.get('/location/country/add', country.add)
  app.post('/location', location.add)