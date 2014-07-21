'use strict'

describe 'Controller: WeatherCtrl', ->

  # load the controller's module
  beforeEach module('darrylsnowApp')
  WeatherCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject(($controller, $rootScope) ->
    scope = $rootScope.$new()
    WeatherCtrl = $controller('WeatherCtrl',
      $scope: scope
    )
  )
  it 'should ...', ->
    expect(1).toEqual 1
