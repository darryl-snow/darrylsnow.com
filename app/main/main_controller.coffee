"use strict"

app = angular.module("mysite-main", ["ngRoute"]).config(($routeProvider) ->
	$routeProvider.when "/",
		templateUrl: "main/main.html"
		controller: "MainCtrl"
)

app.controller "MainCtrl", ["$scope", ($scope) ->
	$scope.awesomeThings = [
		"HTML5 Boilerplate"
		"AngularJS"
		"Karma"
	]
]

module.exports = app