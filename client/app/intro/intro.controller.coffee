'use strict'

angular.module('darrylsnowApp').controller 'IntroCtrl', ($scope) ->
  $scope.maximised = false
  $scope.flipped = false

  $scope.email =
    closeEl: '.close'
    overlay:
      templateUrl: 'app/intro/email.html'
      scroll: false

  $scope.phone =
    closeEl: '.close'
    overlay:
      templateUrl: 'app/intro/phone.html'
      scroll: false

  $scope.skype =
    closeEl: '.close'
    overlay:
      templateUrl: 'app/intro/skype.html'
      scroll: false