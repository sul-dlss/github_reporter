begin
  require 'rspec/core/rake_task'
  import 'lib/github_reporter.rb'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  # no rspec available
end
