'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var SubscribersSchema = new Schema({
  email: String
});

module.exports = mongoose.model('Subscribers', SubscribersSchema);