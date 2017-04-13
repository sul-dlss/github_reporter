require_relative '../lib/github_reporter'
require 'yaml'

config = YAML.load_file('config.yml')

client = GithubReporter.new(config['access_token'])
client.dlss_repos.each do |repo|
  next unless client.gemfile_lock_exists_for?(repo)
  next unless client.does_repo_have_gem?(repo, 'dlss-capistrano')
  puts "#{repo} uses dlss-capistrano < 3.4.1" unless client.does_gemfile_lock_have_gem?(repo, 'dlss-capistrano (3.4.1)')
end

# as of 4/13/17
# dor-utils uses dlss-capistrano < 3.4.1
# exhibits uses dlss-capistrano < 3.4.1
# SearchWorks uses dlss-capistrano < 3.4.1
# dlss-workgroup-external-service-integration uses dlss-capistrano < 3.4.1
# purl uses dlss-capistrano < 3.4.1
# sul-embed uses dlss-capistrano < 3.4.1
# earthworks uses dlss-capistrano < 3.4.1
# was-registrar uses dlss-capistrano < 3.4.1
# was-thumbnail-service uses dlss-capistrano < 3.4.1
# dor-camel-routes uses dlss-capistrano < 3.4.1
# discovery-dispatcher uses dlss-capistrano < 3.4.1
# sul-requests uses dlss-capistrano < 3.4.1
# library_hours_rails uses dlss-capistrano < 3.4.1
# image_viewer uses dlss-capistrano < 3.4.1
# colligo uses dlss-capistrano < 3.4.1
# sulbot uses dlss-capistrano < 3.4.1
# heaven uses dlss-capistrano < 3.4.1
# rwj_reporting uses dlss-capistrano < 3.4.1
# systems-dashboard uses dlss-capistrano < 3.4.1
# portfolios uses dlss-capistrano < 3.4.1
# was_robot_suite uses dlss-capistrano < 3.4.1
# dor-scripts uses dlss-capistrano < 3.4.1
# mirador_sul uses dlss-capistrano < 3.4.1
# ld4p-marc21-to-xml uses dlss-capistrano < 3.4.1
# ld4p-marcxml-to-bibframe1 uses dlss-capistrano < 3.4.1
# ld4p-rdf-to-blazegraph uses dlss-capistrano < 3.4.1
# ld4p-marcxml-to-bibframe2 uses dlss-capistrano < 3.4.1
# sparql_to_sw_solr uses dlss-capistrano < 3.4.1
