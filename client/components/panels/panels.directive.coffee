'use strict'

angular.module('darrylsnowApp').directive 'panel', (PackeryService) ->
  restrict: 'C'
  link: (scope, element, attrs) ->

    scope.flip = (direction, panel) ->
      if scope.flipped and scope.back isnt panel
        element.removeClass "flip" + direction
        scope.flipped = false
        PackeryService.update()

        setTimeout =>
          scope.back = panel
          scope.$apply()
          element.addClass "flip" + direction
          scope.flipped = true
          PackeryService.update()
        , 250
      else
        scope.back = panel
        element.toggleClass "flip" + direction
        scope.flipped = !scope.flipped
        PackeryService.update()

      return true

    scope.maximise = ->
      panels = $(".panel")
      for panel in panels
        $(panel).find(".panel-front").css
          opacity: 0

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
              $(panel).find(".panel-front").css
                opacity: 1
              panel.style.opacity = 1
          , 250

        , 250

      ,250

      return true