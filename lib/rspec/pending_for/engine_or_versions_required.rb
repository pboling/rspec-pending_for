module Rspec
  module PendingFor

    class EngineOrVersionsRequired < ArgumentError
      def initialize(method_name, *args)
        message = "#{method_name} requires at least an engine or versions to be specified"
        super(message, *args)
      end
    end

  end
end
