"use strict"

angular.module "darrylsnow"
	.provider "packeryService", ->

		@container = document.querySelector "body"
		@packery = {}

		@selector = ".panel"
		@gutter = 20
		@transition = "0.2s"

		$get: ["$rootScope", ($rootScope) =>

			initialise = =>
				@packery = new Packery @container,
					itemSelector: @selector
					gutter: @gutter
					transitionDuration: @transition

			update = =>
				@packery.layout()

			initialise: initialise
			update: update
		]