require 'rubygems'

def load_all(*patterns)
  patterns.each { |pattern| Dir[pattern].sort.each { |path| load File.expand_path(path) } }
end

def setup_environment
  # Configure Rails Environment
  ENV["RAILS_ENV"] = 'test'
  require File.expand_path("../dummy/config/environment",  __FILE__)

  require 'rspec/rails'
  require 'capybara/rspec'

  Rails.backtrace_cleaner.remove_silencers!

  RSpec.configure do |config|
    config.mock_with :rspec
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
  end
end

def each_run
  FactoryGirl.reload
  ActiveSupport::Dependencies.clear
  
  load_all 'spec/support/**/*.rb'
  load_all 'spec/factories/**/*.rb'
end

if defined?(Spork)
  Spork.prefork { setup_environment }
  Spork.each_run { each_run }
else
  setup_environment
  each_run
end
