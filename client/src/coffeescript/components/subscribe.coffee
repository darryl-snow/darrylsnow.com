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
			morphButton: document.getElementsByClassName("morph-button-subscribe")[0]
			morphContent: document.querySelectorAll(".morph-button-subscribe .morph-button-content")[0]
			button: document.querySelectorAll(".morph-button-subscribe .morph-button-open")[0]
			buttonText: document.querySelectorAll(".morph-button-subscribe .morph-button-open span")[0]
			buttonIcon: document.querySelectorAll(".morph-button-subscribe use")[0]

		if window.location.hostname is "localhost"
			@url = "http://localhost:8000/api/0.1.0/subscriptions"
		else
			@url = "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/subscriptions"

		if @el.subscribeButton
			@addEventListeners()

	addEventListeners: ->

		@el.subscribeButton.addEventListener "click", (e) =>
			e.preventDefault()
			@subscribe()

	subscribe: ->

		# show loading animation on form
		@el.loading.classList.remove "loaded"
		fetch(@url,
			method: "post"
			headers:
				"Accept": "application/json"
				"Content-Type": "application/json"
			body: JSON.stringify
				email: @el.email.value
		).then (response) =>
			@el.loading.classList.add "loaded"
			if response.status is 200
				@el.morphContent.classList.remove "error"
				@el.morphButton.classList.remove "open"
				@el.button.setAttribute "disabled", "disabled"
				@el.buttonText.innerText = "I'll keep you updated"
				@el.buttonIcon.setAttribute "xlink:href", "#icon-check"
			else
				@el.morphContent.classList.add "error"
				console.error JSON.parse(response._body).errors.email.message


module.exports = new Subscription