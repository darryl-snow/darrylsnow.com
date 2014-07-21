'use strict'

angular.module('darrylsnowApp').controller 'WeatherCtrl', ($scope, $http) ->
  $scope.loaded = false

  time = ""
  getTime = ->
    time = new Date( new Date().getTime() + (8 * 3600 * 1000)).toUTCString().replace(" GMT", "" ).substr(-8)

  getTime()

  updateTime = ->
    getTime()
    $scope.time = time.substr(0, time.length - 3)

  setInterval ->
    updateTime()
  , 1000

  $http.get('/api/weather').success (weather) ->
    $scope.weather = weather.data
    $scope.loaded = true

    code = weather.data.current_condition[0].weatherCode

    switch code
      when "113"
        if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
          $scope.icon = "#icon-clear-night"
        else
          $scope.icon = "#icon-clear-day"
      when "116"
        if (time.substr(0,2) > 18) or (time.substr(0,2) <= 6)
          $scope.icon = "#icon-mostly-clear-night"
        else
          $scope.icon = "#icon-mostly-clear-day"
      when "143" then $scope.icon = "#icon-foggy"
      when "248" then $scope.icon = "#icon-foggy"
      when "260" then $scope.icon = "#icon-foggy"
      when "119" then $scope.icon = "#icon-cloudy"
      when "200" then $scope.icon = "#icon-thunder"
      when "176" then $scope.icon = "#icon-light-rain"
      when "263" then $scope.icon = "#icon-light-rain"
      when "266" then $scope.icon = "#icon-light-rain"
      when "281" then $scope.icon = "#icon-light-rain"
      when "284" then $scope.icon = "#icon-light-rain"
      when "293" then $scope.icon = "#icon-light-rain"
      when "296" then $scope.icon = "#icon-light-rain"
      when "311" then $scope.icon = "#icon-light-rain"
      when "353" then $scope.icon = "#icon-light-rain"
      when "386" then $scope.icon = "#icon-light-rain"
      when "299" then $scope.icon = "#icon-heavy-rain"
      when "302" then $scope.icon = "#icon-heavy-rain"
      when "305" then $scope.icon = "#icon-heavy-rain"
      when "308" then $scope.icon = "#icon-heavy-rain"
      when "314" then $scope.icon = "#icon-heavy-rain"
      when "356" then $scope.icon = "#icon-heavy-rain"
      when "359" then $scope.icon = "#icon-heavy-rain"
      when "389" then $scope.icon = "#icon-heavy-rain"
      when "179" then $scope.icon = "#icon-light-snow"
      when "182" then $scope.icon = "#icon-light-snow"
      when "185" then $scope.icon = "#icon-light-snow"
      when "317" then $scope.icon = "#icon-light-snow"
      when "326" then $scope.icon = "#icon-light-snow"
      when "362" then $scope.icon = "#icon-light-snow"
      when "368" then $scope.icon = "#icon-light-snow"
      when "392" then $scope.icon = "#icon-light-snow"
      when "227" then $scope.icon = "#icon-heavy-snow"
      when "230" then $scope.icon = "#icon-heavy-snow"
      when "320" then $scope.icon = "#icon-heavy-snow"
      when "329" then $scope.icon = "#icon-heavy-snow"
      when "332" then $scope.icon = "#icon-heavy-snow"
      when "365" then $scope.icon = "#icon-heavy-snow"
      when "371" then $scope.icon = "#icon-heavy-snow"
      when "395" then $scope.icon = "#icon-heavy-snow"
      when "350" then $scope.icon = "#icon-hail"
      when "374" then $scope.icon = "#icon-hail"
      when "377" then $scope.icon = "#icon-hail"
      when "122" then $scope.icon = "#icon-overcast"
      else $scope.icon = "#icon-clear-day"