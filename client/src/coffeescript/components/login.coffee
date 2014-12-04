class Login

	constructor: ->
		@el =
			panel: document.getElementsByClassName("morph-button-login")[0]
			panelContent: document.querySelectorAll(".morph-button-login .morph-button-content")[0]
			loading: document.querySelectorAll(".morph-button-login .loading")[0]
			email: document.getElementsByClassName("js-login-email")[0]
			password: document.getElementsByClassName("js-login-password")[0]
			loginButton: document.getElementsByClassName("js-login")[0]

		@addEventListeners()

	addEventListeners: ->

		@el.loginButton.addEventListener "click", (e) =>
			e.preventDefault()
			@login()

	login: ->
		console.log @el.email.value
		console.log @el.password.value

		# show loading animation on form
		@el.loading.classList.remove "loaded"
		fetch("http://darrylsnow-darrylsnow.rhcloud.com/auth/local",
			method: "get"
			headers:
				"Accept": "application/json"
				"Content-Type": "application/json"
			body: JSON.stringify
				email: @el.email.value
				password: @el.password.value
		).then (response) =>
			console.log response
			@el.loading.classList.add "loaded"

		# try to login
		# 	hide loading animation
		# 	if login successful
		# 		remove error class from panelContent
		# 		close panel
		# 		transition page?
		# 	else
		# 		add error class to panelContent


module.exports = new Login