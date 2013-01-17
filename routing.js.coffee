#= require ./underscore-min

App.routing_yaml = YAML.load('routing.yml')
App.routing = (hash = {}, route) ->
  $.each(App.routing_yaml.routing.API, (key, val) ->
    if _.isEqual(key, route)
      route = val
      unless _.isEmpty(hash)
        $.each(hash, (key, val) ->
          route = route.replace(":"+key, val)
        )
      return false
  )

  return route
