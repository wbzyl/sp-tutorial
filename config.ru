$:.unshift('lib') unless $:.include?('lib')

gem 'wbzyl-sp-tutorial'
require 'sp-tutorial'

gem 'wbzyl-rack-codehighlighter'
require 'rack/codehighlighter'

gem 'ultraviolet'
require 'uv'

use Rack::ShowExceptions
use Rack::Lint
use Rack::Codehighlighter, :ultraviolet, :element => 'pre>code', :markdown => true
run WB::SPTutorial.new
