require("es6-promise").polyfill()
require "fetch"
Cookies = require "cookies-js"

class Login

	constructor: ->
		@el =
			panel: document.getElementsByClassName("morph-button-login")[0]
			panelContent: document.querySelectorAll(".morph-button-login .morph-button-content")[0]
			loading: document.querySelectorAll(".morph-button-login .loading")[0]
			email: document.getElementsByClassName("js-login-email")[0]
			password: document.getElementsByClassName("js-login-password")[0]
			loginButton: document.getElementsByClassName("js-login")[0]
			clientButton: document.getElementsByClassName("button-client-area")[0]

		if window.location.hostname is "localhost"
			@url = "http://localhost:8000/auth/local"
		else
			@url = "http://darrylsnow-darrylsnow.rhcloud.com/auth/local"

		if @el.loginButton
			@addEventListeners()

	addEventListeners: ->

		@el.loginButton.addEventListener "click", (e) =>
			e.preventDefault()
			@login()

	login: ->

		@el.loading.classList.remove "loaded"
		fetch(@url,
			method: "post"
			headers:
				"Accept": "application/json"
				"Content-Type": "application/json"
			body: JSON.stringify
				email: @el.email.value
				password: @el.password.value
		).then (response) =>
			@el.loading.classList.add "loaded"

			if response.status is 200
				@el.panelContent.classList.remove "error"
				@el.panel.classList.remove "open"
				@el.panel.classList.add "button--hidden"
				@el.clientButton.classList.remove "button--hidden"

				Cookies.set "darrylsnow", JSON.stringify
					token: JSON.parse(response._body).token
					email: @el.email.value
				,
					expires: 86400 # expires in 24 hours
					# domain: "yourweb.expert"
					# secure: true # cookie is only available over SSL

				# window.location.href = "admin.html"

			else
				@el.panelContent.classList.add "error"
				console.error JSON.parse(response._body).message

	logout: ->
		Cookies.expire "darrylsnow"
		Cookies "darrylsnow", undefined



module.exports = new Login