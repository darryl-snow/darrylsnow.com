"use strict"

require "angular"
require "angular-animate"
require "angular-route"
require "angular-ui-router"
require "./templates"

# other modules
require "./intro/intro-controller.coffee"
require "./skills/skills-controller.coffee"

app = angular.module("darrylsnow", [
	"ngAnimate"
	"ngRoute"
	"ui.router"
	"darrylsnow-skills"
	"darrylsnow-intro"
	"templates"
]).config [
	"$routeProvider"
	"$stateProvider"
	"$urlRouterProvider"
	"$locationProvider"
	($routeProvider, $stateProvider, $urlRouterProvider, $locationProvider) ->

		# $urlRouterProvider
		# 	.otherwise "/"

		$stateProvider
			.state "main",
				# abstract: true
				controller: "MainCtrl"
				templateUrl: "scripts/panels.html"
				# template: "<div class='container' ui-view></div>"
				url: "/"

		# $routeProvider
		# 	.when "/",
		# 		controller: "MainCtrl"
		# 		reloadOnSearch: false
		# 		templateUrl: "scripts/panels.html"
		# 	.otherwise redirectTo: "/"

		$locationProvider.html5Mode true
]

app.controller "MainCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	($scope, $state, $stateParams) ->
		console.log "main"
		console.log $stateParams
]

# require "./global/panel-directive.coffee"