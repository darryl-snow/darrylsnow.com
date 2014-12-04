require("es6-promise").polyfill()
require "fetch"

class Availability

	constructor: ->

		@el =
			activity: document.getElementsByClassName("availability-activity")[0]
			loading: document.querySelectorAll(".availability .loading")[0]
			spinner: document.querySelectorAll(".availability .loading-spinner")[0]

		@activity = "nothing"

		@updateUI()
		@getActivity()

	getActivity: ->

		fetch "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/availability"
			.then (response) =>
				availability = JSON.parse response._body
				@activity = aavailability.activity

				@updateUI()
				@hideLoader()

	updateUI: ->

		@el.activity.innerText = @activity

	hideLoader: ->

		@el.loading.classList.add "loaded"
		setTimeout =>
			@el.spinner.remove()
		, 400


module.exports = new Availability