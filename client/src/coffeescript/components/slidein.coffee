class Slidein

	constructor: ->
		@el =
			doc: window.document.documentElement
			slideSections: document.getElementsByClassName "slide-in"
			perspective: document.getElementsByClassName("perspective")[0]

		@viewPortFactor = 0.2

		@didScroll = false
		window.addEventListener "scroll", =>
			@didScroll = true

		@hasResized = false
		window.addEventListener "resize", =>
			@hasResized = true

		if @el.perspective

			setInterval =>
				if @didScroll and !@menuIsOpen()
					@updateSections()
					@didScroll = false
			, 100

			setInterval =>
				if @hasResized and !@menuIsOpen()
					@updateSections()
					@hasResized = false
			, 100

			if !@menuIsOpen()
				@updateSections()

	updateSections: ->
		for section in @el.slideSections
			@checkIfVisible(section, @viewPortFactor)

	menuIsOpen: ->
		@el.perspective.classList.contains "open"

	checkIfVisible: (section, factor) ->
		sectionHeight = section.offsetHeight
		amountScrolled = @scrollY()
		viewed = amountScrolled + @getViewportHeight()
		sectionTop = @getOffset(section)
		sectionBottom = sectionTop + sectionHeight
		factor = factor || 0

		visible = (sectionTop + sectionHeight * factor) - 100 <= viewed &&
		 sectionBottom >= amountScrolled

		if visible and !section.classList.contains "seen"
			section.classList.add "seen"

	scrollY: ->
		window.pageYOffset || @el.doc.scrollTop

	getViewportHeight: ->
		client = @el.doc["clientHeight"]
		inner = window["innerHeight"]

		return inner if client < inner
		return client if inner < client
		return inner if client is inner

	getOffset: (el) ->
		offsetTop = 0

		loop
			offsetTop += el.offsetTop
			el = el.offsetParent
			break if el is document.body

		offsetTop

module.exports = new Slidein