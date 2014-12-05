"use strict"

mongoose = require "mongoose"
Schema = mongoose.Schema

AvailabilitySchema = new Schema
	date: String
	activity: String

module.exports = mongoose.model "Availability", AvailabilitySchema