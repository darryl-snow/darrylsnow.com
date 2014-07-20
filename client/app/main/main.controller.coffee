'use strict'

angular.module('darrylsnowApp').controller 'MainCtrl', ($scope, $http, socket, PackeryService) ->

  PackeryService.initialise()

  $scope.update = ->
    PackeryService.update()

  # $scope.awesomeThings = []

  # $http.get('/api/things').success (awesomeThings) ->
  #   $scope.awesomeThings = awesomeThings
  #   socket.syncUpdates 'thing', $scope.awesomeThings

  # $scope.addThing = ->
  #   return if $scope.newThing is ''
  #   $http.post '/api/things',
  #     name: $scope.newThing

  #   $scope.newThing = ''

  # $scope.deleteThing = (thing) ->
  #   $http.delete '/api/things/' + thing._id

  # $scope.$on '$destroy', ->
  #   socket.unsyncUpdates 'thing'