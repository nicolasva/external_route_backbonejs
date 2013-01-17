#= require ./underscore-min

App.routing_yaml = YAML.load('routing.yml')
App.routing = (hash = {}, route) ->
  route_val = ""
  $.each(App.routing_yaml.routing.API, (key, val) ->
    if _.isEqual(key, route)
      route_val = val
      unless _.isEmpty(hash)
        $.each(hash, (key, val) ->
          route_val = route_val.replace(":"+key, val)
        )
      return false
  )

  return route_val
