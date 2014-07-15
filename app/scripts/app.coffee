"use strict"

require "angular"
require "angular-animate"
require "angular-ui-router"
require "./templates"

# other modules
require "./intro/intro-controller.coffee"
# require "./skills/skills-controller.coffee"

app = angular.module("darrylsnow", [
	"ngAnimate"
	"ui.router"
	"darrylsnow-intro"
	# "darrylsnow-skills"
	"templates"
]).config [
	"$stateProvider"
	"$urlRouterProvider"
	"$locationProvider"
	($stateProvider, $urlRouterProvider, $locationProvider) ->

		$urlRouterProvider
			.otherwise "/"

		$stateProvider
			.state "main",
				controller: "MainCtrl"
				url: "/"

		$locationProvider.html5Mode true
]

require "./global/packery-service.coffee"

app.controller "MainCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	"packeryService"
	($scope, $state, $stateParams, packeryService) ->

		packeryService.initialise()

		$scope.update = ->
			packeryService.update()
]

require "./global/panel-directive.coffee"
require "./global/resize-panel-directive.coffee"