# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monikers/version'

Gem::Specification.new do |gem|
  gem.name          = "monikers"
  gem.version       = Monikers::VERSION
  gem.authors       = ["Ben Di"]
  gem.email         = ["bdifrancesco@ascensionpress.com"]
  gem.description   = %q{Cached List of First Name Monikers}
  gem.summary       = %q{Gem contains a precached data structure of first name monikers & convenience methods for access & comparison}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.10'
end
