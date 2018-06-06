require_relative '../lib/github_reporter'
require 'yaml'

config = YAML.load_file('config.yml')

client = GithubReporter.new(config['access_token'])
client.dlss_repos.each do |repo|
  next unless client.gemfile_exists_for?(repo)
  puts "#{repo} uses dor-workflow-service" if client.does_repo_have_gem?(repo, 'dor-workflow-service')
end
