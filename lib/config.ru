# http://stackoverflow.com/questions/4980877/rails-error-couldnt-parse-yaml
require 'yaml'
YAML::ENGINE.yamler= 'syck'

require 'bundler'

Bundler.require

require 'sp-tutorial'

require 'uv'
require 'rack/codehighlighter'

#use Rack::ShowExceptions
#use Rack::Lint

use Rack::Codehighlighter, :ultraviolet, :markdown => true,
  :element => "pre>code", :pattern => /\A:::([-\w]+)\s*\n/

run WB::SP.new
