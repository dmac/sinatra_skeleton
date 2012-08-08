require "bundler/setup"
require "pathological"
require "sinatra/base"
require "sinatra/reloader"
require "pinion"
require "pinion/sinatra_helpers"
require "bourbon"
require "coffee-script"
require "sinatra/content_for2"

class App < Sinatra::Base
  include Pinion::SinatraHelpers

  set :pinion, Pinion::Server.new("/assets")

  configure do
    pinion.convert :sass => :css
    pinion.convert :coffee => :js
  end

  configure :development do
    register Sinatra::Reloader
  end

  pinion.watch "public"
  pinion.watch "#{Gem.loaded_specs["bourbon"].full_gem_path}/app/assets/stylesheets"

  helpers Sinatra::ContentFor2

  get "/" do
    erb :index
  end
end
