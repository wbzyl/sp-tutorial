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
    set :app_file, __FILE__
    set :static, true

    set :erubis, :pattern => '\{% %\}', :trim => true
    set :markdown, :layout => false

    set :logging, true  # use Rack::CommonLogger

    helpers Sinatra::Filler

    get '/' do
      erubis(markdown(:main))
    end

    get '/:section' do
      erubis(markdown(:"#{params[:section]}"))
    end

    error do
      e = request.env['sinatra.error']
      Kernel.puts e.backtrace.join("\n")
      'Application error'
    end

  end
end

