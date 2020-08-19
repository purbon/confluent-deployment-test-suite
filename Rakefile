require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

task :spec    => 'spec:all'
task :default => :spec

config = YAML.load_file('cluster.yml')

kafka_hosts = config["kafka"]
connect_hosts = config["connect"]
schema_registry_hosts = config["schema-registry"]

hosts = config["kafka"].clone
        .concat(config["zookeeper"])
        .concat(config["connect"])
        .concat(config["schema-registry"])
        .concat(config["control-center"])

namespace :spec do

  task :all => hosts.map {|h| 'spec:' + h.split('.')[0] }
  hosts.each do |host|
    short_name = host.split('.')[0]
    role       = short_name.match(/[^0-9]+/)[0]

    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(short_name) do |t|
      ENV['TARGET_HOST'] = host
      t.pattern = "spec/#{role}/*_spec.rb"
    end
  end

  desc "Run test only for the AK dataflow"
  RSpec::Core::RakeTask.new("flow") do |t|
    ENV['TARGET_HOST'] = hosts[0]
    t.pattern = "spec/ak/flow/dataflow_spec.rb"
  end

  ssl_hosts = kafka_hosts | schema_registry_hosts | connect_hosts
  task :ssl => ssl_hosts.map {|h| 'ssl:' + h.split('.')[0] }
  ssl_hosts.each do |host|
    short_name = host.split('.')[0]
    role       = short_name.match(/[^0-9]+/)[0]

    desc "Run test for the AK SSL configuration in #{host}"
    RSpec::Core::RakeTask.new("ssl:#{short_name}") do |t|
      ENV['TARGET_HOST'] = host
      t.pattern = "spec/ssl/ssl_spec.rb"
    end
  end


end
