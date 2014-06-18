"use strict"

require "angular"
require "angular-animate"
require "angular-route"
require "./templates"

# other modules
require "./intro/intro-controller.coffee"

app = angular.module("darrylsnow", [
	"ngAnimate"
	"ngRoute"
	"darrylsnow-intro"
	"templates"
]).config [
	"$routeProvider"
	"$locationProvider"
	($routeProvider, $locationProvider) ->
		$routeProvider.otherwise redirectTo: "/"
		$locationProvider.html5Mode true
]

require "./global/panel-directive.coffee"

# app.animation ".panel", ->
# 	beforeAddClass: (element, className, done) ->
# 		if className is "panel--maximised"
# 			element.toggleClass "expanding"
# 			done()
# 		return
# 	beforeRemoveClass: (element, className, done) ->
# 		if className is "panel--maximised"
# 			element.toggleClass "expanding"
# 			done()
# 		return