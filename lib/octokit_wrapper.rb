require 'octokit'

class OctokitWrapper

  Octokit.auto_paginate = true

  def initialize(access_token, org)
    @client = Octokit::Client.new(:access_token => access_token)
    @org = org
  end

  def repo_names
    repos = @client.organization_repositories(@org)
    repos.map { |r| r[:name] }
  end

  def file_exists?(repo, filepath)
    @client.contents("#{@org}/#{repo}", :path => filepath)
    true
  rescue
    false
  end

  def file_contains?(repo, filepath, string)
    file = get_file_content(repo, filepath)
    if file.include?(string)
      true
    end
  rescue
    false
  end

  def get_filenames(repo, filepath)
    filenames = @client.contents("#{@org}/#{repo}", :path => filepath, :type => 'dir')
    filenames.map { |f| f[:path] }
  end

  def get_file_content(repo, filepath)
    file_content = @client.contents("#{@org}/#{repo}", :path => filepath)
    Base64.decode64(file_content.content)
  end
end
