'use strict'

angular.module('darrylsnowApp').directive 'panel', (PackeryService) ->
  restrict: 'C'
  link: (scope, element, attrs) ->

    setSize = (direction) ->

      if direction is "down" or direction is "up"
        element.css
          marginBottom: "115px"
        PackeryService.update()

      setTimeout =>
        backHeight = element.find(".panel-back").outerHeight()
        backWidth = element.find(".panel-back").outerWidth()

        if scope.flipped
          if direction is "down" or direction is "up"
            element.css
              marginBottom: backHeight
          else if direction is "right" or direction is "left"
            element.css
              marginRight: backWidth
        else
          if direction is "down" or direction is "up"
            element.css
              marginBottom: 0
          else if direction is "right" or direction is "left"
            element.css
              marginRight: 0
        
        setTimeout ->
          PackeryService.update()
        , 250

      , 250

    scope.flip = (direction, panel) ->
      if scope.flipped and scope.back isnt panel
        element.removeClass "flip" + direction
        scope.flipped = false
        setSize(direction)

        setTimeout =>
          scope.back = panel
          element.addClass "flip" + direction
          scope.flipped = true
          if !scope.$$phase
            scope.$apply()
          setSize(direction)
        , 250
      else
        scope.back = panel
        element.toggleClass "flip" + direction
        scope.flipped = !scope.flipped
        if !scope.$$phase
          scope.$apply()
        setSize(direction)

      return true

    scope.maximise = ->
      panels = $(".panel")
      for panel in panels

        if panel isnt element[0]
          panel.style.opacity = 0

      setTimeout =>
        element.toggleClass "panel--maximised"
        scope.maximised = !scope.maximised
        scope.$apply()

        setTimeout =>
          PackeryService.update()

          setTimeout =>
            for panel in panels
              panel.style.opacity = 1
          , 250

        , 250

      ,250

      return true