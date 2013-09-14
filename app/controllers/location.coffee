mongoose = require 'mongoose'
Country = mongoose.model 'Country'

# exports.show = (req, res) ->
#   res.render 'locations/show',
#     title: 'location'
  

exports.list = (req, res) ->
  Country.find (err, countries) ->
    if not err
      res.json countries
    else
      console.log err
      
exports.add = (req, res) ->
  country = new Country(req.body)
  country.save (err) ->
    if not err
      console.log 'save'
    else
      console.log err
  
  res.json(country)
  
  
    
