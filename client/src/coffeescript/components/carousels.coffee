Hammer = require "hammerjs"

class Carousel

	constructor: (el, time) ->

		@carousel = el
		@carouselItems = @carousel.getElementsByClassName "carousel-item"
		@numberOfItems = @carouselItems.length

		@setupPagination()

		@currentItem = 0

		@goto(@currentItem)

		@time = time || 5000
		@timer = undefined

		if @carousel.classList.contains "js-carousel--automatic"
			@startTimer(@time, 0)

		options =
			dragLockToAxis: true
			dragBlockHorizontal: true

		if navigator.userAgent.indexOf "Windows Phone" is -1

			hammertime = new Hammer @carousel, options

			hammertime.on "dragend", (e) =>
				alert("sefe")
				if e.gesture.deltaX > 0
					@prev()
				else
					@next()

	setupPagination: ->

		pagination = "<ul class='pagination' data-carousel=" +
		 @carousel.getAttribute("id") + ">"
		for item, index in @carouselItems
			pagination += "<li class='pagination-item'><a href='javascript:void(0);'" +
				" title='See another fun fact'>" +
				"Fun Fact #{index}</a></li>"
		pagination += "</ul>"
		@carousel.insertAdjacentHTML "beforeBegin", pagination

		@pagination = (document.querySelectorAll "[data-carousel='" +
			@carousel.getAttribute("id") + "']")[0]
		@paginationItems = @pagination.childNodes

		addEvent = (item, index) =>
			item.childNodes[0].addEventListener "click", (e) =>
				_gaq.push ["_trackEvent", "Carousel", "Click", @carousel, index]
				e.preventDefault()
				@currentItem = index
				@goto(@currentItem)

				if @carousel.classList.contains "js-carousel--automatic"
					@stopTimer()
					@startTimer(@time, index)

		for item, index in @paginationItems
			addEvent(item, index)

	goto: (index) ->
		@clearAll()
		@paginationItems[index].classList.add "current"
		@carouselItems[index].classList.add "show"

		@carousel.style.height = @carouselItems[index].scrollHeight + 20 + "px"

	clearAll: ->

		for item in @paginationItems
			if item.classList.contains "current"
				item.classList.remove "current"

		for item in @carouselItems
			if item.classList.contains "show"
				item.classList.remove "show"

	startTimer: (time, index) ->

		@timer = setInterval =>

			@next()

		, time

	stopTimer: ->

		clearInterval @timer

	prev: ->
		if @currentItem is 0
			@currentItem = @carouselItems.length
		else
			@currentItem--

		@goto(@currentItem)

	next: ->
		if @currentItem is @numberOfItems - 1
			@currentItem = 0
		else
			@currentItem++

		@goto(@currentItem)

module.exports = Carousel