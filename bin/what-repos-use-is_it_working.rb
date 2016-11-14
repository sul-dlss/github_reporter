require_relative '../lib/github_reporter'
require 'yaml'

config = YAML.load_file('config.yml')

client = GithubReporter.new(config['access_token'])
client.dlss_public_repos.each do |repo|
  next unless client.gemfile_exists_for?(repo)
  if client.does_repo_have_gem?(repo, 'is_it_working-cbeer')
    puts "#{repo} uses is_it_working-cbeer"
    next
  end
  puts "#{repo} uses is_it_working" if client.does_repo_have_gem?(repo, 'is_it_working')
end

# 11/02/16
# hydrus uses is_it_working-cbeer
# argo uses is_it_working-cbeer
# revs uses is_it_working-cbeer
# frda uses is_it_working-cbeer
# dor-fetcher-service uses is_it_working
# earthworks uses is_it_working
# was-thumbnail-service uses is_it_working-cbeer
# sul-requests uses is_it_working
# library_hours_rails uses is_it_working
# sul-directory uses is_it_working
# image_viewer uses is_it_working
# dor_indexing_app uses is_it_working-cbeer
# portfolios uses is_it_working-cbeer
