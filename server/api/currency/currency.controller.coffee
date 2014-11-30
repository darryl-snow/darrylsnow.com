"use strict"

config = require "../../config/environment"
request = require "request"

exports.index = (req, res) ->

	baseRate = 2400 #USD

	request "http://openexchangerates.org/api/latest.json?app_id=" + config.currency.clientID, (error, response, body) ->
		if !error and response.statusCode is 200
			allRates = JSON.parse body
			rates =
				USD: Math.ceil 1 * baseRate
				CNY: Math.ceil allRates.rates.CNY * baseRate
				EUR: Math.ceil allRates.rates.EUR * baseRate
				GBP: Math.ceil allRates.rates.GBP * baseRate
			res.jsonp rates