App.routing_yaml = YAML.load('routing.yml')
App.routing = (hash = {}, route) ->
  route_val = ""
  $.each(App.routing_yaml.routing.API, (key, val) ->
    if key == route
      route_val = val 
  )

  if _.isEmpty(hash)
    return route_val
  else
    $.each(hash, (key, val) ->
      route_val = route_val.replace(":"+key, val)
    )
    return route_val
