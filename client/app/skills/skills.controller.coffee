'use strict'

angular.module('darrylsnowApp').controller 'SkillsCtrl', ($scope, SkillsService, PackeryService) ->

  $scope.loaded = false

  SkillsService.query "", (skills) ->
    $scope.skills = skills
    PackeryService.update()
    $scope.loaded = true