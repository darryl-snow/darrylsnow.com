'use strict'

angular.module('darrylsnowApp').controller 'RatesCtrl', ($scope, $http) ->

  $scope.loaded = false

  usdValue = 2000
  $scope.icon = "#icon-dollar"

  formatCurrency = (value) ->
    value.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')

  $http.get('/api/currencies').success (currencies) ->
    $scope.currencies = currencies
    $scope.loaded = true
    $scope.value = formatCurrency(usdValue)

  $scope.convert = (currency) ->
    $scope.listOpen = false
    $scope.value = formatCurrency(Math.round($scope.currencies.rates[currency] * usdValue))
    switch currency
      when "USD" then $scope.icon = "#icon-dollar"
      when "GBP" then $scope.icon = "#icon-gbp"
      when "EUR" then $scope.icon = "#icon-euro"
      when "CNY" then $scope.icon = "#icon-cny"
      else $scope.icon = "#icon-dollar"