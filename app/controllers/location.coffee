mongoose = require 'mongoose'
Country = mongoose.model 'Country'

exports.list = (req, res) ->
  Country.find (err, countries) ->
    if not err
      console.info 'countries json'
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
  
  res.json req.body
  
  
  
    
