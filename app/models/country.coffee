mongoose = require 'mongoose'
env = process.env.NODE_ENV || 'development'
config = require('../../config/config')[env]
Schema = mongoose.Schema 

countrySchema = new Schema(
  name:[
    zh: 
      type: String, required: true
    en: 
      type: String, required: true
  ]
  description:[
    zh:
      type: String
    en: 
      type: String
  ]
  image:
    origin: 
      type: String
    large: 
      type: String
    medium: 
      type: String
    small: 
      type: String
    thumbnail: 
      type: String
  created_at: 
    type: Date, default: Date.now()
  updated_at:
    type: Date, default: Date.now()
)

mongoose.model 'Country', countrySchema 
