'use strict'

angular.module('darrylsnowApp').controller 'BookCtrl', ($scope, SubscriptionService) ->
  
  $scope.email = ""
  $scope.success = false
  $scope.error = false
  $scope.loading = false

  $scope.subscribe = ->

    if $scope.subscription.$valid

      $scope.loading = true

      $scope.subscriber = new SubscriptionService(
        email: $scope.email
      )
      $scope.subscriber.$save (response) ->

        $scope.loading = false

        if !response.errors?
          $scope.subscriber = response
          $scope.success = true
          console.info "Subscribed " + $scope.email
        else
          $scope.error = true
          console.error response.errors.name.message