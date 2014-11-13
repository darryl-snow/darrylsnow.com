Skills = require('./skills.model')

exports.index = (req, res, next) ->
	Skills.find {}, (err, skills) ->
		if err then return res.send 500, err
		res.jsonp skills

exports.show = (req, res, next) ->
	res.send "not done yet"

exports.create = (req, res, next) ->
	res.send "not done yet"

exports.update = (req, res, next) ->
	res.send "not done yet"

exports.destroy = (req, res, next) ->
	res.send "not done yet"