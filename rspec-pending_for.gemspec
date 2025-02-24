# frozen_string_literal: true

# NOTE: Have to use __FILE__ until Ruby 1.x support is dropped
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# NOTE: This allows us to reload the file for specs and have it be accurately tracked for test coverage
Kernel.load("rspec/pending_for/version.rb")
gem_version = Rspec::PendingFor::Version::VERSION
# NOTE: This prevents the warning about a redefined constant.
Rspec::PendingFor::Version.send(:remove_const, :VERSION)
Rspec::PendingFor.send(:remove_const, :VERSION)

Gem::Specification.new do |spec|
  # Linux distros may package ruby gems differently,
  #   and securely certify them independently via alternate package management systems.
  # Ref: https://gitlab.com/oauth-xx/version_gem/-/issues/3
  # Hence, only enable signing if the cert_file is present.
  # See CONTRIBUTING.md
  default_user_cert = "certs/#{ENV.fetch("GEM_CERT_USER", ENV["USER"])}.pem"
  default_user_cert_path = File.join(File.dirname(__FILE__), default_user_cert)
  cert_file_path = ENV.fetch("GEM_CERT_PATH", default_user_cert_path)
  cert_chain = cert_file_path.split(",")
  if cert_file_path && cert_chain.map {|fp| File.exist?(fp) }
    spec.cert_chain = cert_chain
    if $PROGRAM_NAME.end_with?("gem", "rake") && ARGV[0] == "build"
      spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem")
    end
  end

  spec.name = "rspec-pending_for"
  spec.version = gem_version
  spec.authors = ["Peter Boling"]
  spec.email = ["peter.boling@gmail.com"]

  spec.summary = "Mark specs pending or skipped for specific Ruby engine (e.g. MRI or JRuby) / version combinations"
  spec.description = <<-DESCRIPTION
Mark specs pending or skipped for specific Ruby engine (e.g. MRI or JRuby) / version combinations
  DESCRIPTION
  spec.homepage = "https://github.com/pboling/rspec-pending_for"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 1.8.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/-/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/-/blob/v#{spec.version}/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/-/issues"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata["wiki_uri"] = "#{spec.homepage}/-/wiki"
  spec.metadata["mailing_list_uri"] = "https://groups.google.com/g/oauth-ruby"
  spec.metadata["funding_uri"] = "https://liberapay.com/pboling"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir[
    # Files (alphabetical)
    "lib/**/*",
  ]
  # Automatically included with gem package, no need to list again in files.
  spec.extra_rdoc_files = Dir[
    # Files (alphabetical)
    "CHANGELOG.md",
    "CODE_OF_CONDUCT.md",
    "CONTRIBUTING.md",
    "LICENSE.txt",
    "README.md",
    "SECURITY.md",
  ]
  spec.rdoc_options += [
    "--title",
    "#{spec.name} - #{spec.summary}",
    "--main",
    "README.md",
    "--line-numbers",
    "--inline-source",
    "--quiet",
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency("rspec-core", "~> 3.0")
  spec.add_dependency("ruby_engine", "~> 2.0")
  spec.add_dependency("ruby_version", "~> 1.0")

  # Tests
  spec.add_development_dependency("minitest", "~> 5.3")                 # ruby >= 0
  spec.add_development_dependency("rspec", "~> 3.13")                   # ruby >= 0
  spec.add_development_dependency("rspec-block_is_expected", "~> 1.0")  # ruby >= 1.8.7

  # Development Tasks
  spec.add_runtime_dependency("rake", ">= 10")         # Last version supporting Ruby 1.8.7

  # Linting - rubocop-lts v0 is a rubocop wrapper for Ruby >= 1.8.7,
  #   and should only be bumped when dropping old Ruby support
  # NOTE: it can only be installed on, and run on Ruby >= 2.7, so we add the dependency in the Gemfile.
  # see: https://rubocop-lts.gitlab.io
  # spec.add_development_dependency 'rubocop-lts', ['~> 0.1', '>= 0.1.1']
end
