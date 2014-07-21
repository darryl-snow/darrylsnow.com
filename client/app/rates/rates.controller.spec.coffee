'use strict'

describe 'Controller: RatesCtrl', ->

  # load the controller's module
  beforeEach module('darrylsnowApp')
  RatesCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject(($controller, $rootScope) ->
    scope = $rootScope.$new()
    RatesCtrl = $controller('RatesCtrl',
      $scope: scope
    )
  )
  it 'should ...', ->
    expect(1).toEqual 1
