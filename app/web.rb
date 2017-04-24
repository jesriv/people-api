require 'sinatra'

class Web < Sinatra::Base
  get '/' do
    "People API"
  end
end