'use strict'

angular.module('lojvalsiApp')
  .controller 'TranslateJbo2EnCtrl', ($scope, $routeParams, $localStorage) ->
    $scope.$storage = $localStorage

    return unless $routeParams.valsi

    valsiMap = dictionary.dictionary.direction[0].valsi

    valsi = $routeParams.valsi.trim()
    $scope.input = valsi

    $localStorage.lasts = [] unless $localStorage.lasts?
    if $localStorage.lasts[0]?.label != valsi
      $localStorage.lasts = $localStorage.lasts.filter (a) -> a.label != valsi
      $localStorage.lasts.unshift
        href: '#/translate/jbo/en/' + valsi
        label: valsi
      $localStorage.lasts = $localStorage.lasts.slice(0, 6)

    resultList = valsiMap[valsi]
    $scope.results = []
    if resultList?
      result = resultList[0]
      result.v = valsi
      result.r = [result.r] if 'string' == typeof(result.r)
      $scope.results.push result

    gismu = dictionary.dictionary.direction[0].rafsi[valsi]
    if gismu?
      result = valsiMap[gismu][0]
      result.v = gismu
      result.r = [result.r] if 'string' == typeof(result.r)
      $scope.results.push result

