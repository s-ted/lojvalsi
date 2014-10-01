'use strict'

angular.module('lojvalsiApp')
  .directive('tedParseNotes', ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      result = attrs['notes']
        .replace(/\$([^$]+)\$/g, '<i>$1</i>')
        .replace(/_{?([0-9]+)}?/g, '<sub>$1</sub>')
        .replace(/{([^}]+)}/g, '<a href="#/translate/jbo/en/$1">$1</a>')

      element.html result
  )
