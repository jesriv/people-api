require './app/web'
require './app/api'

run Rack::Cascade.new [API, Web]