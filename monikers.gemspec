# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monikers/version'

Gem::Specification.new do |gem|
  gem.name          = 'monikers'
  gem.version       = Monikers::VERSION
  gem.authors       = ['Ben Di']
  gem.email         = ['bdifrancesco@ascensionpress.com']
  gem.description   = 'Cached List of First Name Monikers (nicknames) in easy-access Ruby Gem'
  gem.summary       = 'Gem contains a precached data structure of first name monikers & ' \
                      'convenience methods for access & comparison'
  gem.homepage      = 'https://github.com/apbendi/monikers'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'rubocop-rspec'
end
