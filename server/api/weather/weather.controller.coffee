"use strict"

config = require "../../config/environment"
request = require "request"

exports.index = (req, res) ->

	request "http://api.worldweatheronline.com/free/v1/weather.ashx?q=Kunming&format=json&num_of_days=1&key=" + config.weatheronline.clientID, (error, response, body) ->
		if !error and response.statusCode is 200
			res.jsonp body