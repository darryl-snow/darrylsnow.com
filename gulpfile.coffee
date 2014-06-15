gulp = require("gulp")
plugins = require("gulp-load-plugins")(lazy: false)

express		= require "express"
open		= require "open"
path		= require "path"
lr			= require("tiny-lr")()

gulp.task "scripts", ->
	gulp.src "./app/**/*.coffee"
	.pipe plugins.coffeelint()
	.pipe plugins.coffeelint.reporter()

	gulp.src "./app/app.coffee", read:false
	.pipe plugins.browserify
		transform: ["coffeeify"]
	# .pipe plugins.coffee
	# 	bare: true
	.pipe plugins.uglify
		mangle: false
	.pipe plugins.rename "app.js"
	.pipe gulp.dest "./build"

gulp.task "templates", ->
	gulp.src ["!./app/index.jade", "./app/**/*.jade"]
	.pipe plugins.jade
		pretty: false
	.pipe plugins.angularTemplatecache "templates.js",
		standalone: true
	.pipe gulp.dest "./app"

gulp.task "css", ->
	gulp.src "./app/styles/main.styl"
	.pipe plugins.stylus
		set: ["compress"]
	.pipe plugins.autoprefixer "last 1 version", "> 1%", "ie 8", "ie 7"
	.pipe plugins.minifyCss()
	.pipe plugins.rename "app.css"
	.pipe gulp.dest "./build"

gulp.task "vendorJS", ->
	gulp.src ["!./bower_components/**/*.min.js", "./bower_components/**/*.js"]
	.pipe plugins.concat "lib.js"
	.pipe plugins.uglify
		mangle: false
	.pipe gulp.dest "./build"

gulp.task "vendorCSS", ->
	gulp.src ["!./bower_components/**/*.min.css", "./bower_components/**/*.css"]
	.pipe plugins.concat "lib.css"
	.pipe plugins.minifyCss()
	.pipe gulp.dest "./build"

gulp.task "copy-index", ->
	gulp.src "./app/index.jade"
	.pipe plugins.jade
		pretty: false
	.pipe gulp.dest "./build"

gulp.task "watch", ->
	gulp.watch [
		"build/**/*.js"
		"build/**/*.css"
		"build/**/*.html"
	], notifyLivereload

	gulp.watch [
		"./app/**/*.coffee"
		"!./app/**/*test.coffee"
	], ["scripts"]

	gulp.watch [
		"!./app/index.jade"
		"./app/**/*.jade"
	], ["templates"]

	gulp.watch "./app/**/*.styl", ["css"]
	gulp.watch "./app/index.jade", ["copy-index"]

gulp.task "server", ->
	app = express()
	app.use require("connect-livereload")()
	app.use express.static "./build"
	app.listen 9000
	lr.listen 35729
	open("http://localhost:9000")

notifyLivereload = (event) ->

	fileName = "/" + path.relative "./build", event.path
	gulp.src event.path, read: false
		.pipe require("gulp-livereload")(lr)

gulp.task "default", [
	"scripts"
	"templates"
	"css"
	"copy-index"
	"vendorJS"
	"vendorCSS"
	"watch"
	"server"
]