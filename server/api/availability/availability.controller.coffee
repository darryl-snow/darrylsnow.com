"use strict"

Availability = require "./availability.model"

exports.index = (req, res, next) ->
	Availability.find {}, (err, availabilities) ->
		if err then res.send 500, err
		res.jsonp availabilities

exports.show = (req, res, next) ->
	availabilityDate = req.params.date

	Availability.findOne
		date: availabilityDate
	, (err, availability) ->
		if err then next err
		# if !availability then res.send 401
		res.jsonp availability

exports.create = (req, res, next) ->
	newAvailability = new Availability req.body
	newAvailability.save (err, availability) ->
		if (err) then return res.send 500, err
		res.jsonp availability