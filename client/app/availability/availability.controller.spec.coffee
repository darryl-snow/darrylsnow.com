'use strict'

describe 'Controller: AvailabilityCtrl', ->

  # load the controller's module
  beforeEach module('darrylsnowApp')
  AvailabilityCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject(($controller, $rootScope) ->
    scope = $rootScope.$new()
    AvailabilityCtrl = $controller('AvailabilityCtrl',
      $scope: scope
    )
  )
  it 'should ...', ->
    expect(1).toEqual 1
