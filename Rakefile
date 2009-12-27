require 'rake'

$LOAD_PATH.unshift('lib')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name         = "sp-tutorial"
    gemspec.summary      = "Notatki do wykladu Srodowisko Programisty."    
    gemspec.email        = "matwb@ug.edu.pl"
    gemspec.authors      = ["Wlodek Bzyl"]
    gemspec.homepage     = "http://github.com/wbzyl/sp-ii"

    gemspec.description = <<-EOF
Notatki do wykladu: Srodowisko Programisty
    EOF
    
    gemspec.files = FileList['lib/**/*', "Rakefile",
                             "VERSION.yml", "sp-tutorial.gemspec"]

    gemspec.add_runtime_dependency 'rack' 
    gemspec.add_runtime_dependency 'sinatra'
    gemspec.add_runtime_dependency 'rdiscount'
    gemspec.add_runtime_dependency 'ultraviolet'
    gemspec.add_runtime_dependency 'rack-codehighlighter'
    gemspec.add_runtime_dependency 'sinatra-rdiscount'    
    gemspec.add_runtime_dependency 'sinatra-static-assets'
   
    gemspec.rubyforge_project = 'sp-tutorial'
  end
  Jeweler::GemcutterTasks.new  
rescue LoadError
  puts "Jeweler not available."
  puts "Install it with:"
  puts "  sudo gem install jeweler -s http://gemcutter.com"
end
