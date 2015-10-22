# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/pending_for/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-pending_for"
  spec.version       = Rspec::PendingFor::VERSION
  spec.authors       = ["Peter Boling"]
  spec.email         = ["peter.boling@gmail.com"]

  spec.summary       = %q{Mark specs pending or skipped for specific Ruby engine (e.g. MRI or JRuby) / version combinations}
  spec.homepage      = "https://github.com/pboling/rspec-pending_for"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec-core"
  spec.add_dependency "ruby_version", "~> 1.0"
  spec.add_dependency "ruby_engine", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
