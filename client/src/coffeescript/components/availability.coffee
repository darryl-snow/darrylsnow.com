require("es6-promise").polyfill()
require "fetch"

class Availability

	constructor: ->

		@el =
			activity: document.getElementsByClassName("availability-activity")[0]
			loading: document.querySelectorAll(".availability .loading")[0]
			spinner: document.querySelectorAll(".availability .loading-spinner")[0]

		@activity = "nothing"

		if window.location.hostname is "localhost"
			@url = "http://localhost:8000/api/0.1.0/availability"
		else
			@url = "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/availability"

		@updateUI()
		@getActivity()

	getActivity: ->

		d = new Date()
		date = d.getFullYear() + "/" + ("0" + (d.getMonth()+1)).slice(-2) + "/" +
		 ("0" + d.getDate()).slice(-2)

		fetch @url + "/" + encodeURIComponent(date)
			.then (response) =>

				availability = JSON.parse response._body
				if availability
					@activity = availability.activity
				else
					@activity = "resting :)"

				@updateUI()
				@hideLoader()

	updateUI: ->

		if @el.activity
			@el.activity.innerText = @activity

	hideLoader: ->

		@el.loading.classList.add "loaded"
		setTimeout =>
			@el.spinner.remove()
		, 400


module.exports = new Availability