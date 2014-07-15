"use strict"

angular.module("darrylsnow")
	.directive "panel", ->
		link = (scope, element, attrs) ->

			element[0].style.height = element[0].clientHeight + "px"
			element[0].style.width = element[0].clientWidth + "px"

		restrict: "C"
		link: link