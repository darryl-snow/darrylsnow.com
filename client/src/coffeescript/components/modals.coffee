class Modal
	el =
		modals: document.getElementsByClassName "modal"
		modalTriggers: document.getElementsByClassName "js-modal-trigger"
		modalOverlays: document.getElementsByClassName "modal-overlay"
		closeModalButtons: document.getElementsByClassName "js-modal-close"

	constructor: ->

		@setupTriggers()
		@setupCloseButtons()
		@setupOverlays()
		@addKeyListener()

	setupTriggers: ->

		for trigger in el.modalTriggers

			trigger.addEventListener "click", (e) =>
				e.preventDefault()
				_gaq.push ["_trackEvent", "Modal Trigger", "Click", trigger]
				modal = document.getElementById "modal-" + e.target.dataset.modal
				@openModal(modal)

	setupCloseButtons: ->

		for button in el.closeModalButtons

			button.addEventListener "click", (e) =>
				e.preventDefault()
				_gaq.push ["_trackEvent", "Modal Close", "Click", button]
				modal = document.getElementById "modal-" + e.target.dataset.modal
				@closeModal(modal)

	setupOverlays: ->

		for overlay in el.modalOverlays

			overlay.addEventListener "click", (e) =>
				_gaq.push ["_trackEvent", "Modal Overlay", "Click", overlay]
				@closeAllModals()

	addKeyListener: ->

		document.onkeyup = (e) =>
			e = e || window.event
			charCode = if typeof e.which is "number" then e.which else e.keyCode

			if charCode is 27
				@closeAllModals()

	openModal: (modal) ->

		modal.classList.add "modal-show"

	closeModal: (modal) ->

		if modal.classList.contains "modal-show"
			modal.classList.remove "modal-show"

	closeAllModals: ->

		for modal in el.modals
			@closeModal(modal)


module.exports = new Modal