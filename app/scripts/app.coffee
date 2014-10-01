'use strict'

angular
  .module('lojvalsiApp', [
    'ngRoute',
    'ngStorage',
  ])

  .config ($routeProvider) ->
    $routeProvider
      .when '/translate/en/jbo/:word?',
        templateUrl: 'views/translateEn2Jbo.html'
        controller: 'TranslateEn2JboCtrl'
      .when '/translate/jbo/en/:valsi?',
        templateUrl: 'views/translateJbo2En.html'
        controller: 'TranslateJbo2EnCtrl'
      .otherwise
        redirectTo: '/translate/jbo/en/'
