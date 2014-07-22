/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');

module.exports = function(app) {

  // Insert routes below
  app.use('/api/users', require('./api/user'));
  app.use('/api/tumblr', require('./api/tumblr'));
  app.use('/api/skills', require('./api/skills'));
  app.use('/api/currencies', require('./api/currency'));
  app.use('/api/weather', require('./api/weather'));
  app.use('/api/subscribe', require('./api/subscribe'));

  app.use('/auth', require('./auth'));

  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|bower_components|assets)/*')
   .get(errors[404]);

  // All other routes should redirect to the index.html
  app.route('/*')
    .get(function(req, res) {
      res.sendfile(app.get('appPath') + '/index.html');
    });
};
