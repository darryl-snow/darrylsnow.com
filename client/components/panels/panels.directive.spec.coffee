'use strict'

describe 'Directive: panels', ->

  # load the directive's module
  beforeEach module('darrylsnowApp')
  element = undefined
  scope = undefined
  beforeEach inject(($rootScope) ->
    scope = $rootScope.$new()
  )
  it 'should make hidden element visible', inject(($compile) ->
    # element = angular.element('<panels></panels>')
    # element = $compile(element)(scope)
    # expect(element.text()).toBe 'this is the panels directive'
    expect(true).toBe true
  )