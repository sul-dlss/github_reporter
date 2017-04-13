require 'octokit'

class GithubReporter

  Octokit.auto_paginate = true

  attr_reader :access_token
  attr_reader :client

  def initialize(access_token)
    @access_token = access_token
    @client = Octokit::Client.new(:access_token => @access_token)
  end

  def token
    @client.access_token
  end

  def dlss_repos
    dlss_repo_names = []
    raw_repos = @client.organization_repositories('sul-dlss')
    raw_repos.each { |repo| dlss_repo_names << repo.name }
    dlss_repo_names
  end

  # TODO: refactor to file_exists_for?(file_name, repo_name)
  def gemfile_exists_for?(repo_name)
    begin
      @client.contents("sul-dlss/#{repo_name}", { :path => 'Gemfile' })
      true
    rescue
      false
    end
  end

  def gemfile_lock_exists_for?(repo_name)
    begin
      @client.contents("sul-dlss/#{repo_name}", { :path => 'Gemfile.lock' })
      true
    rescue
      false
    end
  end

  def does_repo_have_gem?(repo_name, gem_name)
    gemfile = @client.contents("sul-dlss/#{repo_name}", { :path => 'Gemfile' })
    Base64.decode64(gemfile.content).include?(gem_name)
  end

  def does_gemfile_lock_have_gem?(repo_name, gem_name_and_version)
    gemfile = @client.contents("sul-dlss/#{repo_name}", { :path => 'Gemfile.lock' })
    Base64.decode64(gemfile.content).include?(gem_name_and_version)
  end
end
