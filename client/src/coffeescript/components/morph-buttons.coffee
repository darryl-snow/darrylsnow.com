class Morph

	constructor: ->
		@el =
			open: document.getElementsByClassName("morph-button-open")
			close: document.getElementsByClassName("morph-button-close")
			morphs: document.getElementsByClassName "morph-button"

		@addEventListeners()

	addEventListeners: ->

		for button in @el.open

			button.addEventListener "click", (e) =>
				e.preventDefault()
				morph = document.getElementsByClassName("morph-button-" + e.target.dataset.morph)[0]
				@openMorph morph

		for button in @el.close

			button.addEventListener "click", (e) =>
				e.preventDefault()
				morph = document.getElementsByClassName("morph-button-" + e.target.dataset.morph)[0]
				@closeMorph morph

	openMorph: (morph) ->
		@closeAll()
		morph.classList.add "open"

	closeMorph: (morph) ->
		morph.classList.remove "open"

	closeAll: ->

		for morph in @el.morphs
			@closeMorph(morph)


module.exports = new Morph