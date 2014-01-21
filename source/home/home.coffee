'use strict'

angular.module('dapper.home', [
  'ui.router'
])

.config ($stateProvider) ->
  $stateProvider
    .state 'home',
      url: '/home'
      templateUrl: "home/home"
      controller: 'dapHomeController'

.controller 'dapHomeController', ($scope) ->
  @BUILD_DIR = '/* @echo BUILD_DIR */'
