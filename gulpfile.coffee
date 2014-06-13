# minify
# livereload

gulp = require("gulp")
plugins = require("gulp-load-plugins")(lazy: false)

gulp.task "scripts", ->
	gulp.src "./app/**/*.coffee"
	.pipe plugins.coffeelint()
	.pipe plugins.coffeelint.reporter()

	gulp.src "./app/app.coffee", read:false
	.pipe plugins.browserify
		transform: ["coffeeify"]
	# .pipe plugins.coffee
	# 	bare: true
	.pipe plugins.rename "app.js"
	.pipe gulp.dest "./build"

gulp.task "templates", ->
	gulp.src ["!./app/index.jade", "./app/**/*.jade"]
	.pipe plugins.jade
		pretty: false
	.pipe plugins.angularTemplatecache "templates.js",
		standalone: true
	.pipe gulp.dest "./build"

gulp.task "css", ->
	gulp.src "./app/styles/main.styl"
	.pipe plugins.stylus
		set: ["compress"]
	.pipe plugins.rename "app.css"
	.pipe gulp.dest "./build"

gulp.task "vendorJS", ->
	gulp.src ["!./bower_components/**/*.min.js", "./bower_components/**/*.js"]
	.pipe plugins.concat "lib.js"
	.pipe gulp.dest "./build"

gulp.task "vendorCSS", ->
	gulp.src ["!./bower_components/**/*.min.css", "./bower_components/**/*.css"]
	.pipe plugins.concat "lib.css"
	.pipe gulp.dest "./build"

gulp.task "copy-index", ->
	gulp.src "./app/index.jade"
	.pipe plugins.jade
		pretty: false
	.pipe gulp.dest "./build"

gulp.task "watch", ->
	gulp.watch [
		"build/**/*.jade"
		"build/**/*.coffee"
		"build/**/*.styl"
	], (event) ->
		gulp.src(event.path).pipe plugins.connect.reload()

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

gulp.task "connect", plugins.connect.server
	root: ["build"]
	port: 9000
	livereload: true

gulp.task "default", [
	"connect"
	"scripts"
	"templates"
	"css"
	"copy-index"
	"vendorJS"
	"vendorCSS"
	"watch"
]