require "bundler/setup"
require "pathological"
require "sinatra/base"
require "sinatra/reloader"
require "coffee-script"
require "sinatra/content_for2"

class App < Sinatra::Base
  helpers Sinatra::ContentFor2

  configure :development do
    register Sinatra::Reloader
  end

  def initialize(pinion)
    @pinion = pinion
    super
  end

  get "/" do
    erb :index
  end
end
