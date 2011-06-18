require 'bundler'

Bundler.require

require 'sp-tutorial'

require 'coderay'
require 'rack/codehighlighter'

#use Rack::ShowExceptions

use Rack::Codehighlighter, :coderay, :markdown => true, :element => "pre>code"

run WB::SP.new
