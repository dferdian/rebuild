## config.ru
# Start with: shotgun -I. -Ilib
# Under Windows: rackup  (CTRL+C and restart on each change)

require ::File.expand_path("../lib/boot", __FILE__)
require "application"

run Application.new

