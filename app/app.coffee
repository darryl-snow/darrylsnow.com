"use strict"

require "angular"
require "angular-route"
require "./templates"

# other modules
require "./main/main_controller.coffee"

app = angular.module("mysite", [
	"ngRoute"
	"mysite-main"
	"templates"
]).config [
	"$routeProvider"
	"$locationProvider"
	($routeProvider, $locationProvider) ->
		$routeProvider.otherwise redirectTo: "/"
		$locationProvider.html5Mode true
]