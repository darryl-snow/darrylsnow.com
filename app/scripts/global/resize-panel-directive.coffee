"use strict"

angular.module("darrylsnow")
	.directive "resizePanel", ["packeryService", (packeryService) ->
		link = (scope, element, attrs) ->

			element.on "click", ->

				items = document.getElementsByClassName "panel"

				for item in items
					if angular.element(item)[0] isnt element.parent()[0]
						item.style.opacity = "0"

				setTimeout ->

					element.parent().addClass "panel--expanded"

					setTimeout ->
						packeryService.update()

						setTimeout ->

							for item in items
								item.style.opacity = "1"

						, 250

					,250

				, 250

		restrict: "A"
		link: link
	]