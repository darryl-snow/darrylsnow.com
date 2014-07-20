'use strict';

var express = require('express');
var oauth = require('oauth');
var auth = require('../auth.service');
var config = require('../../config/environment');
var Tumblr = require('../../api/tumblr/tumblr.model');

var router = express.Router();

var oauthRequestToken,
    oauthRequestTokenSecret;

var consumer = new oauth.OAuth(  
  "http://www.tumblr.com/oauth/request_token",
  "http://www.tumblr.com/oauth/access_token",
  config.tumblr.clientID,
  config.tumblr.clientSecret,
  "1.0A",
  "http://localhost:9000/auth/tumblr/callback",
  "HMAC-SHA1"
);

router
  .get('/', function(req, res) {
    consumer.getOAuthRequestToken(function(err, oauthToken, oauthTokenSecret){
      if(err) {
        res.send("Error getting Tumblr OAuth request token: " + err, 500);
      } else {
        oauthRequestToken = oauthToken;
        oauthRequestTokenSecret = oauthTokenSecret;
        res.redirect("http://www.tumblr.com/oauth/authorize?oauth_token=" + oauthRequestToken);
      }
    })
  })

  .get('/callback', function(req, res) {
    consumer.getOAuthAccessToken(oauthRequestToken, oauthRequestTokenSecret, req.query.oauth_verifier, function(error, _oauthAccessToken, _oauthAccessTokenSecret) {
      if (error) {
        res.send("Error getting OAuth access token: " + error, 500);
      } else {
        Tumblr.find({}).remove(function() {
          Tumblr.create({
            accessToken: _oauthAccessToken,
            accessTokenSecret: _oauthAccessTokenSecret
          });
        });
        res.redirect("/api/tumblr");
      }
    });
  });

module.exports = router;