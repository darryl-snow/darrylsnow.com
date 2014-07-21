'use strict';

var config = require('../../config/environment');
var request = require('request')

exports.index = function(req, res) {

  request('http://api.worldweatheronline.com/free/v1/weather.ashx?q=Kunming&format=json&num_of_days=1&key=' + config.weatheronline.clientID, function(error, response, body) {
    if(!error && response.statusCode == 200) {
      res.send(body);
    }
  });

};