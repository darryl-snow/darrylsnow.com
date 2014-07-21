'use strict';

// var Tumblr = require('./tumblr.model');
// var tumblr = require('tumblr');
var config = require('../../config/environment');
var request = require('request')

// var accessToken = undefined;
// var accessTokenSecret = undefined;

// Tumblr.find({}, function (err, tokens) {
//   if(err) return res.send(500, err);
//   accessToken = tokens.accessToken
//   accessTokenSecret = tokens.accessTokenSecret
// });

// var oauth = {
//   consumer_key: config.tumblr.clientID,
//   consumer_secret: config.tumblr.clientSecret,
//   token: accessToken,
//   token_secret: accessTokenSecret
// };

// var blog = new tumblr.Blog('darryl-snow.tumblr.com', oauth);

// Get latest post
exports.index = function(req, res) {

  // blog.text({limit: 1}, function(error, response) {
  //   if (error) {
  //     throw new Error(error);
  //   }
  
  //   res.json(response.posts);
  // });
  
  request('http://api.tumblr.com/v2/blog/darryl-snow.tumblr.com/posts?type=text&limit=1&api_key=' + config.tumblr.clientID, function(error, response, body) {
    if(!error && response.statusCode == 200) {
      res.send(body);
    }
  });

};