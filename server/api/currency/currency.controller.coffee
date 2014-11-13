"use strict"

config = require "../../config/environment"
request = require "request"

exports.index = (req, res) ->

	request "http://openexchangerates.org/api/latest.json?app_id=" + config.currency.clientID, (error, response, body) ->
		if !error and response.statusCode is 200
			res.jsonp body