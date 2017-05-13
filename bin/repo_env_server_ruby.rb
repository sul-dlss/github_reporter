require_relative '../lib/octokit_wrapper'
require 'yaml'
require 'json'

config = YAML.load_file('config.yml')
client = OctokitWrapper.new(config['access_token'], 'sul-dlss')

repos_deploy_envs_and_servers = {}

client.repo_names.each do |repo|
  repos_deploy_envs_and_servers[repo] = {}

  next unless client.file_contains?(repo, 'Gemfile.lock', 'capistrano')
  next unless client.file_exists?(repo, 'config/deploy')

  cap_files = client.get_filenames(repo, 'config/deploy')
  cap_files.each do |file|
    filename = File.basename(file, '.rb')
    repos_deploy_envs_and_servers[repo][filename] = {}

    file_content = client.get_file_content(repo, file)
    file_content.each_line do |line|
      next unless line[/^server\s/] && line[/[a-z0-9-]+.stanford.edu/]
        servername = "#{line.match(/[a-z0-9-]+.stanford.edu/)}"
        repos_deploy_envs_and_servers[repo][filename][servername] = {}

        filepath = "hieradata/node/#{servername}.eyaml"
        if client.file_contains?('puppet', filepath, 'role::params::app_ruby')
          h_file = client.get_file_content('puppet', filepath)
          y_file = YAML.load(h_file)
          repos_deploy_envs_and_servers[repo][filename][servername] = y_file['role::params::app_ruby']
        end
    end
  end
end

File.open('data/repo_env_server_ruby.json','w') do |f|
  f.write(JSON.pretty_generate(repos_deploy_envs_and_servers))
end
