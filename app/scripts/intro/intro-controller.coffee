"use strict"

app = angular.module("darrylsnow-intro", ["ngRoute"]).config(($routeProvider) ->
	$routeProvider
		.when "/",
			templateUrl: "scripts/intro/intro.html"
			controller: "IntroCtrl"
)

app.controller "IntroCtrl", ["$scope", ($scope) ->

]

module.exports = app