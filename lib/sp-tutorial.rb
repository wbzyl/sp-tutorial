# -*- coding: utf-8 -*-

require 'rdiscount'
require 'erubis'

require 'sinatra/base'

require 'sinatra/static_assets'
require 'sinatra/filler'

module WB
  class SP < Sinatra::Base
    register Sinatra::StaticAssets

    # disable overriding public and views dirs
    settings.app_file = __FILE__
    settings.static = true
    settings.logging = true  # use Rack::CommonLogger

    set :erb, :pattern => '\{% %\}', :trim => true
    set :markdown, :layout => false

    helpers Sinatra::Filler

    get '/' do
      erb(markdown(:main))
    end

    get '/:section' do
      erb(markdown(:"#{params[:section]}"))
    end

    error do
      e = request.env['sinatra.error']
      Kernel.puts e.backtrace.join("\n")
      'Application error'
    end

  end
end

