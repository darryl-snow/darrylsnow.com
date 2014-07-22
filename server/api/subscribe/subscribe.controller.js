'use strict';

var Subscriber = require('./subscribe.model');

exports.create = function (req, res, next) {

  console.log(req.body);

  var newSubscriber = new Subscriber(req.body);
  newSubscriber.save(function(err, subscriber) {
    if (err) return res.send(500, err);
    res.json(subscriber);
  });
};