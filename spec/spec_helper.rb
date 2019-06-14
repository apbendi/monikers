require 'rubygems'
require 'bundler/setup'

Bundler.require

Dir[File.expand_path('../spec/support/**/*.rb', __dir__)].each { |f| require f }

require 'monikers'
