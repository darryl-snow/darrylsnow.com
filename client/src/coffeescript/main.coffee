"use strict"

calendar	= require "./components/calendar.coffee"
Carousel	= require "./components/carousels.coffee"
login		= require "./components/login.coffee"
menu		= require "./components/menu.coffee"
modals		= require "./components/modals.coffee"
rates		= require "./components/rates.coffee"
subscribe	= require "./components/subscribe.coffee"

carousels = document.getElementsByClassName "carousel"
for carousel in carousels
	new Carousel carousel, 5000