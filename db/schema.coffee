mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/db'

userSchema = new mongoose.Schema
	#_id: Object
	name: String
	email: String
	website: String

mongoose.model 'user', userSchema
module.exports.user = mongoose.model 'user'
