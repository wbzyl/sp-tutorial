source "http://rubygems.org"

# Specify your gem's dependencies in nosql-tutorial.gemspec
gemspec

gem 'sinatra-static-assets', :git => 'git://github.com/wbzyl/sinatra-static-assets.git'
gem 'sinatra-filler', :git => 'git://github.com/wbzyl/sinatra-filler.git'

# undefined method `write' for #<Syck::Emitter:0x37dda38>
#   a workaround
# RUBYOPT='-rpsych' bundle install
#
# Bash: cd tutorials
#   for x in $(ls) ; do pushd $x ; bundle install --path=$HOME/.gems ; popd ;done

gem 'rack-codehighlighter', :git => 'git://github.com/wbzyl/rack-codehighlighter.git', :branch => 'pre-caption'
