'use strict';

var config = require('../../config/environment');
var request = require('request')

exports.index = function(req, res) {

  request('http://openexchangerates.org/api/latest.json?app_id=' + config.currency.clientID, function(error, response, body) {
    if(!error && response.statusCode == 200) {
      res.send(body);
    }
  });

}