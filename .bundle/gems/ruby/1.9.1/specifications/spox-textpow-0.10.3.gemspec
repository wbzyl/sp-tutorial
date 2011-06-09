# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spox-textpow}
  s.version = "0.10.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["spox"]
  s.date = %q{2010-09-27}
  s.description = %q{Textpow is a library to parse and process Textmate bundles.}
  s.email = %q{spox@modspox.com}
  s.executables = ["plist2yaml", "plist2syntax"]
  s.files = ["bin/plist2yaml", "bin/plist2syntax"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0")
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{textpow}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spox-plist>, [">= 0"])
    else
      s.add_dependency(%q<spox-plist>, [">= 0"])
    end
  else
    s.add_dependency(%q<spox-plist>, [">= 0"])
  end
end
