class Menu

	constructor: ->

		@el =
			toggleButton: (document.getElementsByClassName "menu-toggle")[0]
			perspective: (document.getElementsByClassName "perspective")[0]
			cover: (document.querySelectorAll ".cover")[0]
			menuItems: (document.querySelectorAll ".menu a")

		@menuOpen = false

		@addEventListeners()

	addEventListeners: ->

		@el.toggleButton.addEventListener "click", (e) =>
			@toggleMenu()

		@el.cover.addEventListener "click", (e) =>
			@closeMenu()

		for item in @el.menuItems
			item.addEventListener "click", (e) =>
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

	closeMenu: ->
		@el.toggleButton.classList.remove "open"
		@el.perspective.classList.remove "open"
		@menuOpen = false
		

module.exports = new Menu