"use strict"

availability	= require "./components/availability.coffee"
blog			= require "./components/blog.coffee"
calendar		= require "./components/calendar.coffee"
Carousel		= require "./components/carousels.coffee"
login			= require "./components/login.coffee"
modals			= require "./components/modals.coffee"
morph			= require "./components/morph-buttons.coffee"
menu			= require "./components/menu.coffee"
rates			= require "./components/rates.coffee"
slidein			= require "./components/slidein.coffee"
subscribe		= require "./components/subscribe.coffee"
weather			= require "./components/weather.coffee"

carousels = document.getElementsByClassName "carousel"
for carousel in carousels
	new Carousel carousel, 5000