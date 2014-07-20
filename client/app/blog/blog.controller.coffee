'use strict'

angular.module('darrylsnowApp').controller 'BlogCtrl', ($scope, $http) ->

  $scope.loaded = false

  $http.get('/api/tumblr').success (tumblr) ->
    # $scope.post = tumblr[0];
    $scope.post = tumblr.response.posts[0];
    $scope.loaded = true