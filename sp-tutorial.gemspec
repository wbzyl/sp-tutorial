# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "sp-tutorial"
  s.version     = Sp::Tutorial::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Włodek Bzyl"]
  s.email       = ["matwb@ug.edu.pl"]
  s.homepage    = "http://tao.inf.ug.edu.pl"
  s.summary     = %q{Notatki do wykładu Środowisko Programisty}
  s.description = %q{Notatki do wykładu Środowisko Programisty. 2010/2011}

  s.rubyforge_project = "sp-tutorial"

  s.add_runtime_dependency 'rack'
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'rdiscount'
  s.add_runtime_dependency 'erubis'
  s.add_runtime_dependency 'coderay'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
