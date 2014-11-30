require("es6-promise").polyfill()
require "fetch"

class Blog

	constructor: ->

		@el =
			title: (document.querySelectorAll ".js-blog-post-title span")[0]
			date: (document.getElementsByClassName "js-blog-post-date")[0]
			body: (document.getElementsByClassName "js-blog-post-body")[0]
			url: (document.getElementsByClassName "js-blog-post-url")[0]

		@post =
			title: 0
			date: 0
			body: 0
			url: 0

		@getArticle()

	getArticle: ->

		fetch "http://localhost:8000/api/0.1.0/blog"
			.then (response) =>

				blog = JSON.parse response._body

				@post =
					title: blog.title
					date: blog.date
					body: blog.body
					url: blog.url

				@updateUI()

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
		@el.body.innerHTML = @post.body
		@el.url.setAttribute "href"
		@post.url



module.exports = new Blog