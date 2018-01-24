require 'bundler/gem_tasks'

# rubocop:disable Lint/HandleExceptions
begin
  require 'wwtd/tasks'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task :test => :spec
rescue LoadError
  # puts "failed to load wwtd or rspec, probably because bundled --without-development"
end
# rubocop:enable Lint/HandleExceptions

task :default => :test
