"use strict"

User = require "./users.model"
passport = require "passport"
config = require "../../config/environment"
jwt = require "jsonwebtoken"

validationError = (res, err) ->
	return res.jsonp 422, err

# Get list of users
# restriction: "admin"

exports.index = (req, res) ->
	User.find {}, "-salt -hashedPassword", (err, users) ->
		if err then res.send 500, err
		res.jsonp 200, users

# Creates a new user

exports.create = (req, res, next) ->
	newUser = new User req.body
	newUser.provider = "local"
	newUser.role = "user"
	newUser.save (err, user) ->
		if err then validationError res, err
		token = jwt.sign
			_id: user._id
		, config.secrets.session
		, expiresInMinutes: 60*5
		res.jsonp
			token: token


# Get a single user

exports.show = (req, res, next) ->
	userId = req.params.id

	User.findById userId, (err, user) ->
		if err then next err
		if !user then res.send 401
		res.jsonp user.profile

# Deletes a user
# restriction: "admin"

exports.destroy = (req, res) ->
	User.findByIdAndRemove req.params.id, (err, user) ->
		if err then res.send 500, err
		res.send 204


# Change a users password

exports.changePassword = (req, res, next) ->
	userId = req.user._id
	oldPass = String req.body.oldPassword
	newPass = String req.body.newPassword

	User.findById userId, (err, user) ->
		if user.authenticate(oldPass)
			user.password = newPass
			user.save (err) ->
				if err then validationError res, err
				res.send 200
		else
			res.send 403


# Get my info

exports.me = (req, res, next) ->
	console.log req.user
	userId = req.user._id
	User.findOne
		_id: userId
	, "-salt -hashedPassword", (err, user) -> # don"t ever give out the password or salt
		if err then next err
		if !user then res.send 401
		res.jsonp user


# Authentication callback

exports.authCallback = (req, res, next) ->
	res.redirect "/"