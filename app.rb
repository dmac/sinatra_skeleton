require "bundler/setup"
require "pathological"
require "sinatra"
require "coffee-script"
require "sinatra/content_for2"

class App < Sinatra::Base
  helpers Sinatra::ContentFor2

  def initialize(pinion)
    @pinion = pinion
    super
  end

  get "/" do
    erb :index
  end
end
