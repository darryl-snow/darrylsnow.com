@home = (req, res) ->

	# Send raw json when requested from Ajax
	if req.xhr
		res.json {text: "This is the homepage"}
	# Send HTML document otherwise
	else
		res.render 'home', {text: "This is the homepage"}


@user_listing = (req, res) ->

	user_id = req.params.id

	if req.xhr
		res.json {text: "Hello user!", user_id: user_id}
	else
		res.render 'home', {text: "Hello user!", user_id: user_id}