# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "torquebox/no-op/version"

Gem::Specification.new do |s|
  s.name        = "torquebox-no-op"
  s.version     = TorqueBox::NoOp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joe Kutner"]
  s.email       = "jpkutner@gmail.com"
  s.homepage    = "http://github.com/jkutner/torquebox-no-op"
  s.summary     = %q{TorqueBox substitute without all the goodness}
  s.description = %q{Allows you run TorqueBox apps without TorqueBox (most of the app anyways)}

  s.rubyforge_project = "torquebox-no-op"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end