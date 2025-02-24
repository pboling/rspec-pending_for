# frozen_string_literal: true

# RSpec Configs
require_relative "config/byebug"
require_relative "config/rspec/rspec_core"
require_relative "config/rspec/rspec_block_is_expected"

begin
  # Last thing before this gem is code coverage:
  require "kettle-soup-cover"
  # Next line has a side effect of running the local ".simplecov" configuration
  require "simplecov" if defined?(Kettle) && Kettle::Soup::Cover::DO_COV
rescue LoadError
  nil
end

# This gem
require "rspec-pending_for"
