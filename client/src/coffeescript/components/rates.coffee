class Rates

	constructor: ->

		@el =
			rate: (document.getElementsByClassName "rates-number-rate")[0]
			currency: (document.getElementsByClassName "rates-number-currency")[0]
			conversionButtons: document.getElementsByClassName "js-convert-currency"

		@defaultCurrency = "USD"

		@rates =
			USD: 0
			EUR: 0
			GBP: 0
			CNY: 0

		@getRates()
		@addEventListeners()

	getRates: ->

		fetch "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/currency"
			.then (response) =>

				@rates = JSON.parse response._body

				@updateUI @defaultCurrency

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

	addEventListeners: ->

		for button in @el.conversionButtons

			button.addEventListener "click", (e) =>
				e.preventDefault()
				@updateUI e.target.dataset.currency

module.exports = new Rates