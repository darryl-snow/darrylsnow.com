'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var TumblrSchema = new Schema({
  accessToken: String,
  accessTokenSecret: String
});

module.exports = mongoose.model('Tumblr', TumblrSchema);