# frozen_string_literal: true

ruby_version = Gem::Version.new(RUBY_VERSION)
if ruby_version >= Gem::Version.new('2.7') && RUBY_ENGINE == 'ruby'
  require 'simplecov'
end

require 'rspec/pending_for'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
