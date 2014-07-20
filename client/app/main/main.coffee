'use strict'

angular.module('darrylsnowApp')
  .config ($stateProvider) ->
    $stateProvider
    .state('main',
      url: '/',
      templateUrl: 'app/main/main.html'
      controller: 'MainCtrl'
    )