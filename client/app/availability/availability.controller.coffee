'use strict'

angular.module('darrylsnowApp').controller 'AvailabilityCtrl', ($scope) ->
  
  getDate = (offset) ->
    d = new Date()
    utc = d.getTime() + (d.getTimezoneOffset() * 60000)
    nd = new Date(utc + (3600000 * offset))

    days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    months = ["January","February","March","April","May","June","July","August","September","October","November","December"]

    $scope.date = nd.getDate()
    $scope.day = days[nd.getDay()]
    $scope.month = months[nd.getMonth()]
    $scope.year = nd.getFullYear()

  getDate(8)