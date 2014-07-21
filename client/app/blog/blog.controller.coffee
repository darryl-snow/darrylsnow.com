'use strict'

angular.module('darrylsnowApp').controller 'BlogCtrl', ($scope, $http, PackeryService) ->

  $scope.loaded = false

  $http.get('/api/tumblr').success (tumblr) ->
    # $scope.post = tumblr[0];
    $scope.post = tumblr.response.posts[0];
    setTimeout ->
        PackeryService.update()
    , 250
    $scope.loaded = true