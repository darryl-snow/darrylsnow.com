"use strict"

mongoose = require "mongoose"
Schema = mongoose.Schema

SubscribersSchema = new Schema
	email: String

# Validate email is not taken
SubscribersSchema
	.path "email"
	.validate (value, respond) ->
		self = this
		this.constructor.findOne
			email: value
			, (err, user) ->
				if err then throw err
				if user
					if self.id is user.id then return respond true
					return respond false
				respond true
, "Email address is already subscribed."

module.exports = mongoose.model "Subscribers", SubscribersSchema