require("es6-promise").polyfill()
require "fetch"

class Blog

	constructor: ->

		@el =
			title: document.getElementsByClassName("js-blog-post-title")[0]
			date: document.getElementsByClassName("js-blog-post-date")[0]
			body: document.getElementsByClassName("js-blog-post-body")[0]
			url: document.getElementsByClassName("js-blog-post-url")[0]
			button: document.getElementsByClassName("js-blog-post-button")[0]
			loading: document.querySelectorAll(".blog-left .loading")[0]
			spinner: document.querySelectorAll(".blog-left .loading-spinner")[0]

		@post =
			title: 0
			date: 0
			body: 0
			url: 0

		@getArticle()

	getArticle: ->

		fetch "http://darrylsnow-darrylsnow.rhcloud.com/api/0.1.0/blog"
			.then (response) =>

				blog = JSON.parse response._body

				@post =
					title: blog.title
					date: blog.date
					body: blog.body
					url: blog.url

				@updateUI()
				@hideLoader()

	updateUI: ->

		date = new Date @post.date
		day = date.getDate()
		monthNames = [
			"January"
			"February"
			"March"
			"April"
			"May"
			"June"
			"July"
			"August"
			"September"
			"October"
			"November"
			"December"
		]
		month = monthNames[date.getMonth()]
		year = date.getFullYear()

		@el.title.innerText = @post.title
		@el.date.innerText = day + " " + month + ", " + year
		@el.date.setAttribute "content", date
		@el.body.innerHTML = @post.body
		@el.button.setAttribute "href", @post.url
		@post.url.setAttribute "content", @post.url

	hideLoader: ->

		@el.loading.classList.add "loaded"
		setTimeout =>
			@el.spinner.remove()
		, 400

module.exports = new Blog