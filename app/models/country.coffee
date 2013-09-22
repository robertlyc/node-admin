mongoose = require 'mongoose'
env = process.env.NODE_ENV || 'development'
config = require('../../config/config')[env]
Schema = mongoose.Schema 

CountrySchema = new Schema(
  name:
    type: String
    required: true
  description:
    type: String
  # image:
#     origin: 
#       type: String
#     large: 
#       type: String
#     medium: 
#       type: String
#     small: 
#       type: String
#     thumbnail: 
#       type: String
  created_at: 
    type: Date, default: Date.now()
  updated_at:
    type: Date, default: Date.now()
)

mongoose.model 'Country', CountrySchema

