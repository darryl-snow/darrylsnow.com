"use strict"

angular.module("darrylsnow")
	.directive "panel", ->
		controller = ($scope, $element, $attrs) ->

			$scope.$parent.domaximise = ->
				$scope.maximised = !$scope.maximised
				return

		compile = (element, attrs) ->
			
			if attrs["expandable"]
				togglebutton = element[0].getElementsByClassName("toggle-expand-button")[0]

				if !togglebutton
					togglebutton = "
						<button class='button button--small toggle-expand-button'
						 data-ng-click='domaximise()'>
							<svg viewBox='0 0 32 32', data-ng-show='!maximised'>
								<use xlink:href='#icon-resize-enlarge'></use>
							</svg>
							<svg viewBox='0 0 32 32', data-ng-show='maximised'>
								<use xlink:href='#icon-resize-shrink'></use>
							</svg>
						</button>"
					element.append togglebutton
					togglebutton = element[0].getElementsByClassName("toggle-expand-button")[0]

		restrict: "C"
		scope:
			maximised: "=expandable"
		controller: controller
		compile: compile