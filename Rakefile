require 'rake'

$LOAD_PATH.unshift('lib')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name         = "sp-tutorial"
    gemspec.summary      = "Notatki do wyklady z Srodowiska Programisty."    
    gemspec.email        = "matwb@univ.gda.pl"
    gemspec.authors      = ["Wlodek Bzyl"]
    gemspec.homepage     = "http://github.com/wbzyl/sp-tutorial"

    gemspec.description = <<-EOF
Notatki do frameworka Rails3
    EOF
    
    gemspec.files = FileList['lib/**/*', "TODO", "Rakefile",
                             "config.ru", "local.ru",
                             "VERSION.yml", "sp-tutorial.gemspec"]
    
    gemspec.add_runtime_dependency 'rack' 
    gemspec.add_runtime_dependency 'sinatra'
    gemspec.add_runtime_dependency 'rdiscount'
    gemspec.add_runtime_dependency 'ultraviolet'
    gemspec.add_runtime_dependency 'wbzyl-sinatra-rdiscount'    
    gemspec.add_runtime_dependency 'wbzyl-rack-codehighlighter'
  
    gemspec.rubyforge_project = 'sp-tutorial'
  end
rescue LoadError
  puts "Jeweler not available."
  puts "Install it with:"
  puts "  sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
