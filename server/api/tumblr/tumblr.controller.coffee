"use strict"

# Tumblr = require("./tumblr.model")
# tumblr = require("tumblr")
config = require "../../config/environment"
request = require "request"

# accessToken = undefined
# accessTokenSecret = undefined

# Tumblr.find({}, function (err, tokens) {
#   if(err) return res.send(500, err)
#   accessToken = tokens.accessToken
#   accessTokenSecret = tokens.accessTokenSecret
# })

# oauth = {
#   consumer_key: config.tumblr.clientID,
#   consumer_secret: config.tumblr.clientSecret,
#   token: accessToken,
#   token_secret: accessTokenSecret
# }

# blog = new tumblr.Blog("darryl-snow.tumblr.com", oauth)

# Get latest post
exports.index = (req, res) ->

	# blog.text({limit: 1}, function(error, response) {
	#   if (error) {
	#     throw new Error(error)
	#   }
	
	#   res.json(response.posts)
	# })
	
	request "http://api.tumblr.com/v2/blog/darryl-snow.tumblr.com/posts?type=text&limit=1&api_key=" + config.tumblr.clientID, (error, response, body) ->
		if !error and response.statusCode is 200
			res.jsonp body