require 'json'
require 'csv'

file = File.read('data/repo_env_server_ruby.json')
data = JSON.parse(file)

array_for_csv = []
data.map do |repo,env|
  next if env.empty?

  env.map do |env2,server|
    array_for_csv.push([repo,env2]) if server.empty?

    server.map do |server2,rub|
      array_for_csv.push([repo,env2,server2]) if rub.empty?

      rub.map do |rub2,type|
        filter_defaults = "default" if type['default_use'] == true
        array_for_csv.push([repo,env2,server2,rub2,filter_defaults])
      end
    end
  end
end

CSV.open('data/repos_and_rubies.csv', 'w') do |csv|
  header = ['github repo', 'deploy environment', 'servername', 'ruby version', 'ruby type']
  csv << header
  array_for_csv.map do |row|
    csv << row
  end
end
