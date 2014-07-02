"use strict"

app = angular.module("darrylsnow-skills", [
	"ngRoute"
	"ui.router"
]).config [
	"$stateProvider"
	"$urlRouterProvider"
	"$routeProvider"
	($stateProvider, $urlRouterProvider, $routeProvider) ->

		# $stateProvider
		# 	.state "main.skills",
		# 		controller: "SkillsCtrl"
		# 		templateUrl: "scripts/skills/skills.html"
		# 	.state "main.skills-expanded",
		# 		url: "skills/{id}"
		# 		controller: "SkillsCtrl"
		# 		templateUrl: "scripts/skills/skills.html"


		# $routeProvider
		# 	.when "/",
		# 		templateUrl: "scripts/skills/skills.html"
		# 		controller: "SkillsCtrl"
		# 	.when "/about",
		# 		controller: "SkillsExtraCtrl"
]

app.controller "SkillsCtrl", [
	"$scope"
	"$state"
	"$stateParams"
	($scope, $state, $stateParams) ->
		console.log "skills"
		$scope.maximised = false
		$scope.state = $state.current
		$scope.params = $stateParams
]

module.exports = app