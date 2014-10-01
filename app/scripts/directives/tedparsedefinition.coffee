'use strict'

angular.module('lojvalsiApp')
  .directive('tedParseDefinition', ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      result = attrs['definition']
        .replace(/\$([^$]+)\$/g, '<i>$1</i>')
        .replace(/_{?([0-9]+)}?/g, '<sub>$1</sub>')
        .replace(/([^ ]+) modal/g, '<a href="#/translate/jbo/en/$1">$1</a> modal')

      element.html result
  )
