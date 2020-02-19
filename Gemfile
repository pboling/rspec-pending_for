source 'https://rubygems.org'

group :test do
  ruby_version = Gem::Version.new(RUBY_VERSION)
  if ruby_version >= Gem::Version.new('2.1')
    gem 'rubocop', '~> 0.80.0'
    gem 'rubocop-rspec', '~> 1.30.0'
  end
  if ruby_version >= Gem::Version.new('2.0')
    gem 'byebug', '~> 10', :platform => :mri, :require => false
    gem 'pry', '~> 0', :platform => :mri, :require => false
    gem 'pry-byebug', '~> 3', :platform => :mri, :require => false
  end
  gem 'simplecov', '~> 0', :require => false
end

# Specify your gem's dependencies in rspec-pending_for.gemspec
gemspec
