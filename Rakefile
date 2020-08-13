require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

task :spec    => 'spec:all'
task :default => :spec

config = YAML.load_file('cluster.yml')

hosts = config["kafka"]
        .concat(config["zookeeper"])
        .concat(config["connect"])
        .concat(config["schema-registry"])

namespace :spec do

  task :all => hosts.map {|h| 'spec:' + h.split('.')[0] }
  hosts.each do |host|
    short_name = host.split('.')[0]
    role       = short_name.match(/[^0-9]+/)[0]

    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(short_name) do |t|
      ENV['TARGET_HOST'] = host
      t.pattern = "spec/{base,#{role}}/*_spec.rb"
    end
  end

  desc "Run test only for the AK dataflow"
  RSpec::Core::RakeTask.new("flow") do |t|
    ENV['TARGET_HOST'] = hosts[0]
    t.pattern = "spec/ak/dataflow_spec.rb"
  end

  desc "Run test only for the AK SSL configuration"
  RSpec::Core::RakeTask.new("ssl") do |t|
    ENV['TARGET_HOST'] = hosts[0]
    t.pattern = "spec/ak/ssl_spec.rb"
  end

end
