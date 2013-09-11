mongoose = require 'mongoose'
Country = mongoose.model 'Country'

exports.show = (req, res) ->
  res.render('locations/show',
    title: 'location'
  )