# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sp-tutorial}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wlodek Bzyl"]
  s.date = %q{2009-07-03}
  s.description = %q{Notatki do frameworka Rails3
}
  s.email = %q{matwb@univ.gda.pl}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "Rakefile",
     "TODO",
     "VERSION.yml",
     "config.ru",
     "lib/config.ru",
     "lib/public/images/sp.png",
     "lib/public/images/sp.svg",
     "lib/public/javascripts/sp.js",
     "lib/public/stylesheets/icons/doc.png",
     "lib/public/stylesheets/icons/email.png",
     "lib/public/stylesheets/icons/external.png",
     "lib/public/stylesheets/icons/feed.png",
     "lib/public/stylesheets/icons/im.png",
     "lib/public/stylesheets/icons/pdf.png",
     "lib/public/stylesheets/icons/visited.png",
     "lib/public/stylesheets/icons/xls.png",
     "lib/public/stylesheets/ie.css",
     "lib/public/stylesheets/print.css",
     "lib/public/stylesheets/screen.css",
     "lib/public/stylesheets/sp.css",
     "lib/public/stylesheets/src/grid.png",
     "lib/public/stylesheets/uv.css",
     "lib/sp-tutorial.rb",
     "lib/views/answers.rdiscount",
     "lib/views/exercises.rdiscount",
     "lib/views/favicon.ico.rdiscount",
     "lib/views/intro.rdiscount",
     "lib/views/layout.rdiscount",
     "lib/views/main.rdiscount",
     "sp-tutorial.gemspec"
  ]
  s.homepage = %q{http://github.com/wbzyl/sp-tutorial}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sp-tutorial}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Notatki do wyklady z Srodowiska Programisty.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_runtime_dependency(%q<rdiscount>, [">= 0"])
      s.add_runtime_dependency(%q<ultraviolet>, [">= 0"])
      s.add_runtime_dependency(%q<wbzyl-sinatra-rdiscount>, [">= 0"])
      s.add_runtime_dependency(%q<wbzyl-rack-codehighlighter>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<rdiscount>, [">= 0"])
      s.add_dependency(%q<ultraviolet>, [">= 0"])
      s.add_dependency(%q<wbzyl-sinatra-rdiscount>, [">= 0"])
      s.add_dependency(%q<wbzyl-rack-codehighlighter>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<rdiscount>, [">= 0"])
    s.add_dependency(%q<ultraviolet>, [">= 0"])
    s.add_dependency(%q<wbzyl-sinatra-rdiscount>, [">= 0"])
    s.add_dependency(%q<wbzyl-rack-codehighlighter>, [">= 0"])
  end
end
