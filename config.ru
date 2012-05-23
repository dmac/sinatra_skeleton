require "./app"
require "pinion"

PINION_MOUNT_POINT = "/assets"
pinion = Pinion::Server.new(PINION_MOUNT_POINT)
pinion.convert :sass => :css
pinion.convert :coffee => :js
pinion.watch "public"

map(PINION_MOUNT_POINT) { run pinion }
map("/") { run App.new(pinion) }
