class Rates

	constructor: ->

		@el =
			rate: document.getElementsByClassName("rates-number-rate")[0]
			currency: document.getElementsByClassName("rates-number-currency")[0]
			conversionButtons: document.getElementsByClassName "js-convert-currency"
			loading: document.querySelectorAll(".rates-conversions .loading")[0]
			spinner: document.querySelectorAll(".rates-conversions .loading-spinner")[0]

		@defaultCurrency = "USD"

		@rates =
			USD: 0
			EUR: 0
			GBP: 0
			CNY: 0

		if window.location.hostname is "localhost"
			@url = "http://localhost:8000/api/0.1.0/currency"
		else
			@url = "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/currency"

		@getRates()
		@addEventListeners()

	getRates: ->

		fetch @url
			.then (response) =>

				@rates = JSON.parse response._body

				@updateUI @defaultCurrency
				@hideLoader()

	updateUI: (currency) ->

		symbol = "$"

		switch currency
			when "USD" then symbol = "$"
			when "EUR" then symbol = "€"
			when "GBP" then symbol = "£"
			when "CNY" then symbol = "¥"

		amount = @rates[currency]

		if amount.toString().length is 5
			amount = amount.toString().substr(0,2) + "," + amount.toString().substr(2)

		@el.rate.innerText = symbol + amount
		@el.currency.innerText = currency

		@el.rate.setAttribute "content", amount
		@el.currency.setAttribute "content", symbol

	addEventListeners: ->

		for button in @el.conversionButtons

			button.addEventListener "click", (e) =>
				e.preventDefault()
				_gaq.push ["_trackEvent", "Rare", "Click", e.target.dataset.currency]
				@updateUI e.target.dataset.currency

	hideLoader: ->

		@el.loading.classList.add "loaded"
		setTimeout =>
			@el.spinner.remove()
		, 400

module.exports = new Rates