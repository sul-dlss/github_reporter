require 'spec_helper'
require 'github_reporter.rb'
require 'yaml'

describe 'GithubReporter' do

  before(:all) do
    @access_token = YAML.load_file('config.yml')['access_token']
    @github_reporter = GithubReporter.new(@access_token)
  end

  it 'can instantiate with a token' do
    expect(@github_reporter).to be_kind_of(GithubReporter)
  end

  it 'can return the token value' do
    expect(@github_reporter.token).to eql(@access_token)
  end

  # "public_repos": 191
  # "total_private_repos": 27

  it 'returns enough of our repos' do
    expect(@github_reporter.dlss_repos.count).to be > 191
  end

  it 'says whether a repo has a Gemfile or not' do
    expect(@github_reporter.gemfile_exists_for?('openseadragon')).to be_falsey
    expect(@github_reporter.gemfile_exists_for?('puppetdb_reporter')).to be_truthy
  end

  it 'says whether a repo has a Gemfile.lock or not' do
    expect(@github_reporter.gemfile_lock_exists_for?('openseadragon')).to be_falsey
    expect(@github_reporter.gemfile_lock_exists_for?('puppetdb_reporter')).to be_truthy
  end

  it 'says whether a gem is in the Gemfile' do
    expect(@github_reporter.does_repo_have_gem?('puppetdb_reporter', 'is_it_working')).to be_falsey
    expect(@github_reporter.does_repo_have_gem?('sul-requests', 'is_it_working')).to be_truthy
  end

  it 'says whether a gem is in the Gemfile.lock' do
    expect(@github_reporter.does_gemfile_lock_have_gem?('puppetdb_reporter', 'is_it_working (1.1.0)')).to be_falsey
    expect(@github_reporter.does_gemfile_lock_have_gem?('sul-requests', 'is_it_working (1.1.0)')).to be_truthy
  end
end
