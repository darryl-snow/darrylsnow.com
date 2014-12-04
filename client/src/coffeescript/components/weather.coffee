require("es6-promise").polyfill()
require "fetch"

class Weather

	constructor: ->
		@el =
			time: document.getElementsByClassName("weather-time")[0]
			currentTemp: document.querySelectorAll(".weather-info-temperature span")[0]
			maxTemp: document.getElementsByClassName("weather-info-temperature-max")[0]
			minTemp: document.getElementsByClassName("weather-info-temperature-min")[0]
			icon: document.querySelectorAll(".weather-icon use")[0]
			loading: document.querySelectorAll(".weather-forecast .loading")[0]
			spinner: document.querySelectorAll(".weather-forecast .loading-spinner")[0]

		@clock = setInterval =>
			@updateTime()
		, 1000

		@weather =
			condition: 0
			currentTemp: 0
			maxTemp: 0
			minTemp: 0

		@getWeather()

	getTime: ->

		new Date( new Date().getTime() + (28800000)).toUTCString().replace(" GMT", "").substr -8

	updateTime: ->
		time = @getTime()
		time = time.substr(0, time.length - 3)

		if @el.time
			@el.time.innerText = time

	getWeather: ->

		fetch "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/weather"
			.then (response) =>

				weather = JSON.parse response._body

				code = weather.condition
				condition = ""
				time = @getTime()

				switch code
					when "113"
						if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
							condition = "moon"
						else
							condition = "sun"
					when "116"
						if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
							condition = "cloud"
						else
							condition = "cloudy"
					when "119"
						if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
							condition = "cloud"
						else
							condition = "cloudy"
					when "260"
						if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
							condition = "weather2"
						else
							condition = "weather"
					when "248"
						if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
							condition = "weather2"
						else
							condition = "weather"
					when "143"
						if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
							condition = "weather2"
						else
							condition = "weather"
					when "122" then condition = "cloud"
					when "200" then condition = "lightening"
					when "386" then condition = "lightening"
					when "176" then condition = "rainy"
					when "293" then condition = "rainy"
					when "263" then condition = "rainy"
					when "266" then condition = "rainy"
					when "296" then condition = "rainy"
					when "353" then condition = "rainy"
					when "389" then condition = "rainy2"
					when "359" then condition = "rainy2"
					when "308" then condition = "rainy2"
					when "305" then condition = "rainy2"
					when "302" then condition = "rainy2"
					when "299" then condition = "rainy2"
					when "371" then condition = "snowy"
					when "368" then condition = "snowy"
					when "338" then condition = "snowy"
					when "335" then condition = "snowy"
					when "332" then condition = "snowy"
					when "329" then condition = "snowy"
					when "326" then condition = "snowy"
					when "323" then condition = "snowy"
					when "230" then condition = "snowy"
					when "227" then condition = "snowy"
					when "179" then condition = "snowy"
					when "395" then condition = "weather3"
					when "392" then condition = "weather3"
					when "377" then condition = "weather3"
					when "374" then condition = "weather3"
					when "365" then condition = "weather3"
					when "362" then condition = "weather3"
					when "350" then condition = "weather3"
					when "320" then condition = "weather3"
					when "317" then condition = "weather3"
					when "314" then condition = "weather3"
					when "311" then condition = "weather3"
					when "284" then condition = "weather3"
					when "281" then condition = "weather3"
					when "182" then condition = "weather3"
					else condition = "sun"

				@weather =
					condition: condition
					currentTemp: weather.temperature
					maxTemp: weather.max
					minTemp: weather.min

				if @el.currentTemp
					@updateUI()
					@hideLoader()

			.catch (err) ->
				console.error err

	updateUI: ->

		@el.icon.setAttribute "xlink:href", "#icon-" + @weather["condition"]
		@el.currentTemp.innerText = @weather["currentTemp"]
		@el.maxTemp.innerText = " " + @weather["maxTemp"]
		@el.minTemp.innerText = " " + @weather["minTemp"]

	hideLoader: ->

		@el.loading.classList.add "loaded"
		setTimeout =>
			@el.spinner.remove()
		, 400

module.exports = new Weather