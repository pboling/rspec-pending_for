# frozen_string_literal: true

# NOTE: Have to use __FILE__ until Ruby 1.x support is dropped
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/pending_for/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-pending_for'
  spec.version       = Rspec::PendingFor::VERSION
  spec.authors       = ['Peter Boling']
  spec.email         = ['peter.boling@gmail.com']

  spec.summary       = 'Mark specs pending or skipped for specific Ruby engine (e.g. MRI or JRuby) / version combinations'
  spec.homepage      = 'https://github.com/pboling/rspec-pending_for'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*', 'LICENSE', 'README.md', 'CODE_OF_CONDUCT.md']
  spec.bindir        = 'exe'
  spec.rdoc_options  = ["--charset=UTF-8"]
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.8.7'

  spec.add_dependency 'rspec-core'
  spec.add_dependency 'ruby_engine', '>= 1', '< 3'
  spec.add_dependency 'ruby_version', '~> 1.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest', '~> 5.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3'
end
