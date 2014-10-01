'use strict'

angular.module('lojvalsiApp')
  .controller 'TranslateEn2JboCtrl', ($scope, $routeParams, $localStorage) ->
    $scope.$storage = $localStorage

    return unless $routeParams.word

    wordMap = dictionary.dictionary.direction[1].nlword

    $localStorage.lasts = [] unless $localStorage.lasts?
    if $localStorage.lasts[0]?.label != $routeParams.word
      $localStorage.lasts = $localStorage.lasts.filter (a) -> a.label != $routeParams.word
      $localStorage.lasts.unshift
        href: '#/translate/en/jbo/' + $routeParams.word
        label: $routeParams.word
      $localStorage.lasts = $localStorage.lasts.slice(0, 6)

    decorate = (result) ->
      definitions = dictionary.dictionary.direction[0].valsi[result.v]
      if definitions?
        definition = definitions[0]
        angular.extend(result,
          r: if 'string' == typeof(definition.r) then [definition.r] else definition.r
          d: definition.d
        )
      return result

    $scope.word = $routeParams.word
    $scope.input = $scope.word
    resultList = wordMap[$scope.word.trim()]
    if resultList?
      decorate result for result in resultList
      $scope.results = resultList
    else
      $scope.error = 'I don\'t know this word'


