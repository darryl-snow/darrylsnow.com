"use strict"

app = angular.module("mysite-main", ["ngRoute"]).config(($routeProvider) ->
	$routeProvider.when "/",
		templateUrl: "scripts/main/main.html"
		controller: "MainCtrl"
)

app.controller "MainCtrl", ["$scope", ($scope) ->
	$scope.maximised = false
]

module.exports = app