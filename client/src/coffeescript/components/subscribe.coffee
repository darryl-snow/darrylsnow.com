require("es6-promise").polyfill()
require "fetch"

class Subscription

	constructor: ->
		@el =
			panel: document.getElementsByClassName("morph-button-subscribe")[0]
			panelContent: document.querySelectorAll(".morph-button-subscribe .morph-button-content")[0]
			loading: document.querySelectorAll(".morph-button-subscribe .loading")[0]
			email: document.getElementsByClassName("js-subscribe-email")[0]
			subscribeButton: document.getElementsByClassName("js-subscribe")[0]

		@addEventListeners()

	addEventListeners: ->

		@el.subscribeButton.addEventListener "click", (e) =>
			e.preventDefault()
			@subscribe()

	subscribe: ->
		console.log @el.email.value

		# show loading animation on form
		@el.loading.classList.remove "loaded"
		fetch("http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/subscriptions",
			method: "post"
			headers:
				"Accept": "application/json"
				"Content-Type": "application/json"
			body: JSON.stringify
				email: @el.email.value
		).then (response) =>
			console.log response
			@el.loading.classList.add "loaded"

		# try to subscribe
		# 	hide loading animation
		# 	if subscription successful
		# 		remove error class from panelContent
		# 		close panel
		# 		show message
		# 	else
		# 		add error class to panelContent


module.exports = new Subscription