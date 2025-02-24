# frozen_string_literal: true

module Rspec
  module PendingFor
    module Version
      VERSION = "0.1.16"
    end

    # Backwards compatability shim.
    VERSION = Version::VERSION
  end
end
