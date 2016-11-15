require_relative '../lib/github_reporter'
require 'yaml'

config = YAML.load_file('config.yml')

client = GithubReporter.new(config['access_token'])
client.dlss_repos.each do |repo|
  next unless client.gemfile_exists_for?(repo)
  puts "#{repo} uses dlss-capistrano" if client.does_repo_have_gem?(repo, 'dlss-capistrano')
end

# 11/14/16
# releaseboard
# argo
# revs
# sul-pub
# heli_cat
# dor-utils
# dor-services-app
# workflow-archiver-job
# common-accessioning
# robot-master
# exhibits
# assembly
# SearchWorks
# dlss-capistrano
# bassi_veratti
# dlss-workgroup-external-service-integration
# gis-robot-suite
# purl
# pre-assembly
# editstore-updater
# devops-app-scanner
# dor-fetcher-service
# sul-embed
# earthworks
# item-release
# was-registrar
# was-thumbnail-service
# dor-camel-routes
# discovery-dispatcher
# sw-indexer
# sul-requests
# modsulator-app
# library_hours_rails
# sul_styles
# sul-directory
# stacks
# image_viewer
# spotlight-indexer-service
# dor_indexing_app
# libsys-webforms
# system-package-tracker
# sulbot
# heaven
# purl-fetcher
# rwj_reporting
# systems-dashboard
# portfolios
# sul_pub
# was_robot_suite
# goobi-robot
