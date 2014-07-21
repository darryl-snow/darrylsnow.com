'use strict'

describe 'Service: packery', ->

  # load the service's module
  beforeEach module('darrylsnowApp')

  # instantiate service
  packery = undefined
  beforeEach inject((_PackeryService_) ->
    packery = _PackeryService_
  )
  it 'should do something', ->
    expect(!!packery).toBe true
