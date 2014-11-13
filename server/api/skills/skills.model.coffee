"use strict"

mongoose = require "mongoose"
Schema = mongoose.Schema

SkillsSchema = new Schema
	name: String
	description: String
	icon: String

module.exports = mongoose.model "Skills", SkillsSchema