"use strict"

Subscriber = require "./subscriptions.model"

exports.create = (req, res, next) ->

	console.log req.body

	newSubscriber = new Subscriber req.body
	newSubscriber.save (err, subscriber) ->
		if (err) then return res.send 500, err
		res.jsonp subscriber