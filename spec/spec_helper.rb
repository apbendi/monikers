require 'rubygems'
require 'bundler/setup'

Bundler.require

Dir[File.expand_path("../../spec/support/**/*.rb", __FILE__)].each {|f| require f}

require 'pry-debugger'
require 'monikers'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
