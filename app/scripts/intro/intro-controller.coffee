"use strict"

app = angular.module("darrylsnow-intro", [
	"ui.router"
]).config [
	"$stateProvider"
	"$urlRouterProvider"
	($stateProvider, $urlRouterProvider) ->

		# $stateProvider
		# 	.state "main.intro",
		# 		controller: "IntroCtrl"
		# 		templateUrl: "'scripts/intro/intro.html'"
		# 		url: "/"

]

app.controller "IntroCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	($scope, $state, $stateParams, $route) ->
		$scope.hello = "world"
]

module.exports = app