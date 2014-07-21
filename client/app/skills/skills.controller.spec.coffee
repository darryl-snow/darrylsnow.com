'use strict'

describe 'Controller: SkillsCtrl', ->

  # load the controller's module
  beforeEach module('darrylsnowApp')
  SkillsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject(($controller, $rootScope) ->
    scope = $rootScope.$new()
    SkillsCtrl = $controller('SkillsCtrl',
      $scope: scope
    )
  )
  it 'should ...', ->
    expect(1).toEqual 1
