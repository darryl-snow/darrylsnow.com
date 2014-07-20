var Skills = require('./skills.model');

exports.index = function(req, res, next) {
  Skills.find({}, function (err, skills) {
    if(err) return res.send(500, err);
    res.json(skills);
  });
}

exports.show = function(req, res, next) {
  res.send("not done yet");
}

exports.create = function(req, res, next) {
  res.send("not done yet");
}

exports.update = function(req, res, next) {
  res.send("not done yet");
}

exports.destroy = function(req, res, next) {
  res.send("not done yet");
}