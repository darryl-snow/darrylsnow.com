# Populate DB with sample data on server start
# to disable, edit config/environment/index.js, and set `seedDB: false`

"use strict"

User = require "../api/users/users.model"

User.find({}).remove ->
	User.create
		provider: "local",
		name: "Test User",
		email: "test@test.com",
		password: "test"
	,
		provider: "local",
		role: "admin",
		name: "Darryl Snow",
		email: "dazsnow@gmail.com",
		password: "mugwuffin"
	, ->
			console.log "finished populating users"

Availability = require "../api/availability/availability.model"

Availability.find({}).remove ->
	Availability.create
		date: "2014/12/05"
		activity: "diageo"
	,
		date: "2014/12/06"
		activity: "apple"
	, ->
		console.log "finished populating availability"