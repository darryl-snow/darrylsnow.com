morph = require "./morph-buttons.coffee"

class Menu

	constructor: ->

		@el =
			toggleButton: document.getElementsByClassName("menu-toggle")[0]
			perspective: document.getElementsByClassName("perspective")[0]
			cover: document.querySelectorAll(".cover")[0]
			menuItems: document.querySelectorAll(".menu a")

		@menuOpen = false

		if @el.toggleButton
			@addEventListeners()

	addEventListeners: ->

		@el.toggleButton.addEventListener "click", (e) =>
			_gaq.push ["_trackEvent", "Menu", "Toggle", @menuOpen]
			@toggleMenu()

		@el.cover.addEventListener "click", (e) =>
			_gaq.push ["_trackEvent", "Menu", "Overlay", @menuOpen]
			@closeMenu()

		for item in @el.menuItems
			item.addEventListener "click", (e) =>
				_gaq.push ["_trackEvent", "Menu", "Click", item]
				@closeMenu()
	
	toggleMenu: ->

		if @menuOpen
			@closeMenu()
		else
			@openMenu()

	openMenu: ->
		@el.toggleButton.classList.add "open"
		@el.perspective.classList.add "open"
		@menuOpen = true

		morph.closeAll()

	closeMenu: ->
		@el.toggleButton.classList.remove "open"
		@el.perspective.classList.remove "open"
		@menuOpen = false
		

module.exports = new Menu