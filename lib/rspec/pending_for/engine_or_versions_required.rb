# frozen_string_literal: true

module Rspec
  module PendingFor
    # Error class raised when pending_for is used but no engine or version is specified.
    class EngineOrVersionsRequired < ArgumentError
      def initialize(method_name, *args)
        message = "#{method_name} requires at least an engine or versions to be specified"
        super(message, *args)
      end
    end
  end
end
