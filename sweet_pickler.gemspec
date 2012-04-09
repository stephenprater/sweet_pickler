# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sweet_pickler/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["A.G. Russell Knives"]
  gem.email         = ["stephenp@agrussell.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sweet_pickler"
  gem.require_paths = ["lib"]
  gem.version       = SweetPickler::VERSION

  gem.add_dependency 'thor'
  gem.add_dependency 'pivotal-tracker'
  gem.add_dependency 'active_support'
  gem.add_dependency 'gherkin'
end
