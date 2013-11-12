# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "difference/version"

Gem::Specification.new do |s|
  s.name        = "difference"
  s.version     = Difference::VERSION
  s.authors     = ["Manish Puri"]
  s.email       = ["manishspuri@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{difference between 2 objects}
  s.description = %q{This is a simple gem to compare 2 objects of the same class and return a hash of differences}

  s.rubyforge_project = "difference"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_dependency 'activerecord'
  # s.add_runtime_dependency "rest-client"
end
