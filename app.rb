require "bundler/setup"
require "pathological"
require "sinatra"

class App < Sinatra::Base
  def initialize(pinion)
    @pinion = pinion
    super
  end

  get "/" do
    erb :index
  end
end
