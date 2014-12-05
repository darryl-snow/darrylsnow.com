require("es6-promise").polyfill()
require "fetch"
Cookies = require "cookies-js"

# window.history.replaceState(history.state, window.document.title, "client-area")

goHome = ->
	window.location.href = "/"

cookie = Cookies.get "darrylsnow"
if cookie
	cookieData = JSON.parse Cookies.get "darrylsnow"

	if cookieData and cookieData.token
	
		fetch("http://localhost:8000/api/0.1.0/users",
			method: "get"
			headers:
				Authorization: "Bearer " + cookieData.token
		).then (response) ->
			console.log response
	
	else
		goHome()

else
	goHome()