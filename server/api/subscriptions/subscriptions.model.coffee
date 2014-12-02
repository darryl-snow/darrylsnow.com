"use strict"

mongoose = require "mongoose"
Schema = mongoose.Schema

SubscribersSchema = new Schema
	email: String

module.exports = mongoose.model "Subscribers", SubscribersSchema