gulp = require("gulp")
plugins = require("gulp-load-plugins")(lazy: false)

express		= require "express"
open		= require "open"
path		= require "path"
lr			= require("tiny-lr")()

gulp.task "vendorCSS", ->
	gulp.src ["!./bower_components/**/*.min.css", "./bower_components/**/*.css"]
	.pipe plugins.concat "lib.css"
	.pipe plugins.minifyCss()
	.pipe gulp.dest "./app/styles/includes"

gulp.task "css", ["vendorCSS"], ->
	gulp.src "./app/styles/main.styl"
	.pipe plugins.plumber()
	.pipe plugins.stylus
		set: ["compress"]
	.pipe plugins.autoprefixer "last 1 version", "> 1%", "ie 8", "ie 7"
	.pipe plugins.minifyCss()
	.pipe plugins.rename "app.css"
	.pipe plugins.size
		showFiles: true
	.pipe gulp.dest "./build/styles"

gulp.task "templates", ->
	console.log ""
	gulp.src ["!./app/index.jade", "./app/**/*.jade"]
	.pipe plugins.plumber()
	.pipe plugins.jade
		pretty: false
	.pipe plugins.angularTemplatecache "templates.js",
		standalone: true
	.pipe gulp.dest "./app/scripts"

gulp.task "scripts", ["templates"], ->
	gulp.src "./app/scripts/**/*.coffee"
	.pipe plugins.coffeelint()
	.pipe plugins.coffeelint.reporter()

	gulp.src "./app/scripts/app.coffee", read:false
	.pipe plugins.plumber()
	.pipe plugins.browserify
		transform: ["coffeeify"]
	# .pipe plugins.uglify
	# 	mangle: false
	.pipe plugins.rename "app.js"
	.pipe plugins.size
		showFiles: true
	.pipe gulp.dest "./build/scripts"

gulp.task "images", ->
	gulp.src "./app/images/**/*.{jpg,png,gif}"
		.pipe plugins.plumber()
		.pipe plugins.imagemin
			cache: false
		.pipe plugins.size
			showFiles: true
		.pipe gulp.dest "./build/images"

	gulp.src "./app/images/**/*.svg"
		.pipe plugins.plumber()
		.pipe plugins.svgmin()
		.pipe plugins.size
			showFiles: true
		.pipe gulp.dest "./build/images"

gulp.task "copy-files", ->
	gulp.src "./app/index.jade"
	.pipe plugins.jade
		pretty: false
	.pipe gulp.dest "./build"

	gulp.src "./app/darryl-snow-cv--english.pdf"
	.pipe gulp.dest "./build"

gulp.task "watch", ->
	gulp.watch [
		"./build/**/*.js"
		"./build/**/*.css"
		"./build/**/*.html"
		"./build/**/*.{jpg,png,gif,svg}"
	], notifyLivereload

	gulp.watch [
		"./app/scripts/**/*.coffee"
		"!./app/scripts/**/*test.coffee"
		"./app/scripts/**/*.js"
	], ["scripts"]

	gulp.watch [
		"!./app/index.jade"
		"./app/**/*.jade"
	], ["templates"]

	gulp.watch "./app/**/*.styl", ["css"]
	gulp.watch "./app/**/*.{jpg,png,gif,svg}", ["images"]
	gulp.watch "./app/index.jade", ["copy-files"]

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
	"css"
	"images"
	"copy-files"
	"watch"
	"server"
]