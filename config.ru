require "./app"

map App.pinion.mount_point do
  run App.pinion
end

map "/"  do
  run App
end
