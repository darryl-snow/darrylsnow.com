class Slidein

	constructor: ->
		@el =
			doc: window.document.documentElement
			slideSections: document.getElementsByClassName "slide-in"

		@viewPortFactor = 0.2

		@didScroll = false
		window.addEventListener "scroll", =>
			@didScroll = true

		setInterval =>
			if @didScroll
				@updateSections()
				@didScroll = false
		, 100

		@hasResized = false
		window.addEventListener "resize", =>
			@hasResized = true

		setInterval =>
			if @hasResized
				@updateSections()
				@hasResized = false
		, 100

		@updateSections()

	updateSections: ->
		for section in @el.slideSections
			@checkIfVisible(section, @viewPortFactor)

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