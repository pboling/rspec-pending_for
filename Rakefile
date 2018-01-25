require 'bundler/gem_tasks'

begin
  require 'wwtd/tasks'
rescue LoadError
  puts 'failed to load wwtd'
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  # puts "failed to load wwtd or rspec, probably because bundled --without-development"
  task :spec do
    warn 'rspec is disabled'
  end
end
task :test => :spec

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  task :rubocop do
    warn 'RuboCop is disabled'
  end
end

task :default => [:test, :rubocop]
