"use strict"

module.exports = (app) ->

	apiPath = "/api"
	version = "/" + (require "../package.json").version

	app.use apiPath + version + "/hello", (req, res) ->
		res.send "hello"

	app.use apiPath + version + "/currency", require ("./api/currency")
	app.use apiPath + version + "/skills", require ("./api/skills")	
	app.use apiPath + version + "/subscriptions", require ("./api/subscriptions")
	app.use apiPath + version + "/tumblr", require ("./api/tumblr")
	app.use apiPath + version + "/users", require ("./api/users")
	app.use apiPath + version + "/weather", require ("./api/weather")

	app.use "/auth", require ("./auth")

	# All undefined asset or API routes should return a 404

	app.route "/:url(api|auth)/*", (req, res) ->
		res.status 404