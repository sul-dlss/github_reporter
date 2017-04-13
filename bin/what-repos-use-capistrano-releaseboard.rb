require_relative '../lib/github_reporter'
require 'yaml'

config = YAML.load_file('config.yml')

client = GithubReporter.new(config['access_token'])
client.dlss_repos.each do |repo|
  next unless client.gemfile_lock_exists_for?(repo)
  puts "#{repo} uses capistrano-releaseboard" if client.does_gemfile_lock_have_gem?(repo, 'capistrano-releaseboard (')
end
 # as of 4/13/17
# hydrus uses capistrano-releaseboard
# sul-pub uses capistrano-releaseboard
# dor-utils uses capistrano-releaseboard
# archive-catalog uses capistrano-releaseboard
# exhibits uses capistrano-releaseboard
# SearchWorks uses capistrano-releaseboard
# sdr-preservation-core uses capistrano-releaseboard
# sdr-services-app uses capistrano-releaseboard
# course_reserves uses capistrano-releaseboard
# dlss-workgroup-external-service-integration uses capistrano-releaseboard
# gis-robot-suite uses capistrano-releaseboard
# purl uses capistrano-releaseboard
# mods-profiling-indexer uses capistrano-releaseboard
# sul-embed uses capistrano-releaseboard
# earthworks uses capistrano-releaseboard
# item-release uses capistrano-releaseboard
# was-registrar uses capistrano-releaseboard
# was-thumbnail-service uses capistrano-releaseboard
# dor-camel-routes uses capistrano-releaseboard
# revs-indexer-service uses capistrano-releaseboard
# discovery-dispatcher uses capistrano-releaseboard
# sw-indexer uses capistrano-releaseboard
# sul-requests uses capistrano-releaseboard
# modsulator-app uses capistrano-releaseboard
# library_hours_rails uses capistrano-releaseboard
# image_viewer uses capistrano-releaseboard
# colligo uses capistrano-releaseboard
# libsys-webforms uses capistrano-releaseboard
# system-package-tracker uses capistrano-releaseboard
# sulbot uses capistrano-releaseboard
# heaven uses capistrano-releaseboard
# purl-fetcher uses capistrano-releaseboard
# rwj_reporting uses capistrano-releaseboard
# systems-dashboard uses capistrano-releaseboard
# portfolios uses capistrano-releaseboard
# dpn-server uses capistrano-releaseboard
# sul_pub uses capistrano-releaseboard
# was_robot_suite uses capistrano-releaseboard
# goobi-robot uses capistrano-releaseboard
# dor-scripts uses capistrano-releaseboard
# mirador_sul uses capistrano-releaseboard
# sparql_to_sw_solr uses capistrano-releaseboard
