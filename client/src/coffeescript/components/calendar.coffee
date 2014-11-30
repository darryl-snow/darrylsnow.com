class Calendar

	constructor: ->

		@el =
			day: (document.getElementsByClassName "calendar-day")[0]
			date: (document.getElementsByClassName "calendar-date")[0]
			monthandyear: (document.getElementsByClassName "calendar-monthandyear")[0]

		@updateUI @getDate(8)

	getDate: (offset) ->
		d = new Date()
		utc = d.getTime() + (d.getTimezoneOffset() * 60000)
		nd = new Date(utc + (3600000 * offset))

		days = [
			"Sunday"
			"Monday"
			"Tuesday"
			"Wednesday"
			"Thursday"
			"Friday"
			"Saturday"
		]

		months = [
			"January"
			"February"
			"March"
			"April"
			"May"
			"June"
			"July"
			"August"
			"September"
			"October"
			"November"
			"December"
		]

		date =
			day: days[nd.getDay()]
			date: nd.getDate()
			month: months[nd.getMonth()]
			year: nd.getFullYear()

	updateUI: (date) ->
		@el.day.innerText = date["day"]
		@el.date.innerText = date["date"]
		@el.monthandyear = date["month"] + ", " + date["year"]

module.exports = new Calendar