module Rspec
  module PendingFor
    # SRP: Describe the RubyEngine and/or RubyVersion(s) that will be pended or skipped and with what message
    class Build

      #
      # | RUBY_ENGINE | Implementation           |
      # |:-----------:|:------------------------:|
      # | "unknown"   | MRI < 1.9 (probably)     |
      # | "ruby"      | MRI >= 1.9               |
      # | "ree"       | Ruby Enterprise Edition  |
      # | "jruby"     | JRuby                    |
      # | "macruby"   | MacRuby                  |
      # | "rbx"       | Rubinius                 |
      # | "maglev"    | MagLev                   |
      # | "ironruby"  | IronRuby                 |
      # | "cardinal"  | Cardinal                 |
      #

      # Keys are the
      INTERPRETER_MATRIX = {
          "unknown"   => "MRI < 1.9 (probably)",
          "ruby"      => "MRI >= 1.9",
          "ree"       => "Ruby Enterprise Edition",
          "jruby"     => "JRuby",
          "macruby"   => "MacRuby",
          "rbx"       => "Rubinius",
          "maglev"    => "MagLev",
          "ironruby"  => "IronRuby",
          "cardinal"  => "Cardinal"
      }
      BROKEN_STRING = "Behavior is broken"
      BUG_STRING = "due to a bug in the Ruby engine"
      VERSIONS_STRING = "in Ruby versions"
      ISSUES_LINK = "https://github.com/pboling/rspec-pending_for/issues"

      attr_reader :message, :relevant_versions, :relevant_engine, :reason

      def initialize(options = {})
        @relevant_versions = Array(options[:versions]) # cast to array
        @relevant_engine = options[:engine].nil? ? nil : options[:engine].to_s
        @reason = options[:reason]
        warn_about_unrecognized_engine
        # If engine is nil, then any matching versions should be pended
        @message =  if @relevant_engine.nil?
                      no_engine_specified
                    elsif RubyEngine.is? @relevant_engine
                      engine_specified_and_relevant
                    end
      end

      def current_matches_specified?
        !message.nil?
      end

      private

      def warn_about_unrecognized_engine
        return false if relevant_engine.nil? || !INTERPRETER_MATRIX[relevant_engine].nil?
        warn %[
Engine specified (#{relevant_engine}) is not known to rspec-pending_for.
If it is a real RUBY_ENGINE, please report as a bug to #{ISSUES_LINK}
]
      end

      def no_engine_specified
        if relevant_versions.include?(RubyVersion.to_s)
          reason || "#{BROKEN_STRING} #{VERSIONS_STRING} #{relevant_versions} #{BUG_STRING}"
        else
          nil # Not a pended/skipped spec
        end
      end

      def engine_specified_and_relevant
        if relevant_versions.empty?
          # No versions specified means ALL versions for this engine
          reason || "#{BROKEN_STRING} #{BUG_STRING} #{INTERPRETER_MATRIX[relevant_engine]}"
        else
          if relevant_versions.include?(RubyVersion.to_s)
            reason || %[#{BROKEN_STRING} #{VERSIONS_STRING} #{relevant_versions} #{BUG_STRING} (#{INTERPRETER_MATRIX[relevant_engine]})]
          else
            nil # Not a pended/skipped spec
          end
        end
      end

    end
  end
end
