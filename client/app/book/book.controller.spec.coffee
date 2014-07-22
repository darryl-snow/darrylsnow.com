'use strict'

describe 'Controller: BookCtrl', ->

  # load the controller's module
  beforeEach module('darrylsnowApp')
  BookCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject(($controller, $rootScope) ->
    scope = $rootScope.$new()
    BookCtrl = $controller('BookCtrl',
      $scope: scope
    )
  )
  it 'should ...', ->
    expect(1).toEqual 1
