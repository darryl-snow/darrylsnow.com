"use strict"

app = angular.module("darrylsnow-skills", [
	"ui.router"
]).config [
	"$stateProvider"
	"$urlRouterProvider"
	"$routeProvider"
	($stateProvider, $urlRouterProvider, $routeProvider) ->
]

app.controller "SkillsCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	($scope, $state, $stateParams) ->
		console.log "skills"
]

module.exports = app