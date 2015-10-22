require "ruby_version"
require "ruby_engine"
require "rspec/pending_for/version"
require "rspec/pending_for/engine_or_versions_required"
require "rspec/pending_for/build"
require "rspec/pending_for/rspec"

module Rspec

  # Use with Rspec by including in your example groups, just like any other Rspec helpers:
  #
  #     RSpec.configure do |c|
  #       c.include Rspec::PendingFor
  #     end
  #
  module PendingFor

    # How to pend specs that break due to bugs in Ruby interpreters or versions
    #
    #     it("blah is blah") do
    #       pending_for(engine: "ruby", version: "2.1.5")
    #       expect("blah").to eq "blah"
    #     end
    #
    def pending_for(options = {}) # Not using named parameters because still supporting Ruby 1.9
      modify_example_with(:pending, options)
    end

    # How to pend specs that break due to bugs in Ruby interpreters or versions
    #
    #     it("blah is blah") do
    #       skip_for(engine: "jruby", version: "2.2.2")
    #       expect("blah").to eq "blah"
    #     end
    #
    def skip_for(options = {}) # Not using named parameters because still supporting Ruby 1.9
      modify_example_with(:skip, options)
    end

    private

    def modify_example_with(message, options)
      fail(EngineOrVersionsRequired, :pending_for) unless options[:engine] || options[:versions]
      build = Build.new(options)
      self.send(message, build.message) if build.current_matches_specified?
    end

  end
end
