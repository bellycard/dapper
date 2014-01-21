'use strict'

describe 'Home: Module', ->

  # Load the modue we are testing before each test
  beforeEach module('dapper.home')

  describe 'Home: controller', ->
    beforeEach inject (_$controller_, _$rootScope_) ->

      # Create a new scope that will be passed to the controller
      @scope = _$rootScope_.$new()

      # Use the _$controller_ function to request the controller to test
      # $controller takes a second param that maps to the dependency injection of the controller
      # This makes it very easy to mock dependencies
      @ctrl = _$controller_('dapHomeController', {$scope: @scope})

    it 'should exist', ->
      # Simple existence check
      expect(@ctrl).toBeTruthy()
