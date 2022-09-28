# frozen_string_literal: true

# This Gemfile copies liberally from https://github.com/rspec/rspec-core/blob/main/Gemfile
source 'https://rubygems.org'

# Specify your gem's dependencies in rspec-pending_for.gemspec
gemspec

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }
git_source(:gitlab) { |repo_name| "https://gitlab.com/#{repo_name}" }

ruby_version = Gem::Version.new(RUBY_VERSION)
minimum_version = ->(version, engine = "ruby") { ruby_version >= Gem::Version.new(version) && RUBY_ENGINE == engine }
linting = minimum_version.call("2.7")
coverage = minimum_version.call("2.7")
debug = minimum_version.call("2.4")

if ruby_version < Gem::Version.new('1.9.3')
  gem 'rake', '< 11.0.0' # rake 11 requires Ruby 1.9.3 or later
elsif ruby_version < Gem::Version.new('2.0.0')
  gem 'rake', '< 12.0.0' # rake 12 requires Ruby 2.0.0 or later
elsif ruby_version < Gem::Version.new('2.2.0')
  gem 'rake', '< 13.0.0' # rake 13 requires Ruby 2.2.0 or later
else
  gem 'rake', '> 13.0.0'
end

gem 'yard', '~> 0.9.24', :require => false

### deps for rdoc.info
group :documentation do
  gem 'github-markup', :platform => :mri
  gem 'redcarpet', :platform => :mri
end

group :development, :test do
  if debug
    # No need to run byebug / pry on earlier versions
    gem 'byebug', :platform => :mri
    gem 'pry', :platform => :mri
    gem 'pry-byebug', :platform => :mri
  end

  if linting
    # Commented out rubocop-md because of the <--rubocop/md--> bug
    # gem "rubocop-md", :platform => :mri, require: false
    # Can be added once we reach rubocop-lts >= v10 (i.e. drop Ruby 2.2)
    # gem 'rubocop-packaging', :platform => :mri, require: false
    gem 'rubocop-performance', :platform => :mri, require: false
    gem 'rubocop-rake', :platform => :mri, require: false
    gem 'rubocop-rspec', :platform => :mri, require: false
    gem "rubocop-thread_safety", :platform => :mri, require: false

    gem 'simplecov', '~> 0.21', :platform => :mri
  end

  if coverage
    gem "codecov", "~> 0.6" # For CodeCov
    gem "simplecov", "~> 0.21", require: false
    gem "simplecov-cobertura" # XML for Jenkins
    gem "simplecov-json" # For CodeClimate
    gem "simplecov-lcov", "~> 0.8", require: false
  end
end

gem 'contracts', '< 0.16' if ruby_version < Gem::Version.new('1.9.0')
