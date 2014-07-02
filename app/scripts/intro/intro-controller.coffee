"use strict"

app = angular.module("darrylsnow-intro", [
	"ngRoute"
	"ui.router"
]).config [
	"$stateProvider"
	"$urlRouterProvider"
	"$routeProvider"
	($stateProvider, $urlRouterProvider, $routeProvider) ->

		$stateProvider
			.state "main.intro",
				controller: "IntroCtrl"
				# templateUrl: "scripts/intro/intro.html"
			.state "main.intro-expanded",
				url: "/intro"
				controller: "IntroMaxCtrl"
				# templateUrl: "scripts/intro/intro.html"


		# $routeProvider
		# 	.when "/",
		# 		# templateUrl: "scripts/intro/intro.html"
		# 		controller: "IntroCtrl"
		# 	.when "/about",
		# 		controller: "IntroExtraCtrl"
]

app.controller "IntroCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	"$route"
	($scope, $state, $stateParams, $route) ->
		console.log "intro"
		$scope.maximised = false
		$scope.state = $state.current
		$scope.params = $stateParams
]

app.controller "IntroMaxCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	"$route"
	($scope, $state, $stateParams, $route) ->
		console.log "intro MAX"
		$scope.maximised = false
		$scope.state = $state.current
		$scope.params = $stateParams
]

module.exports = app