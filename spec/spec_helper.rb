require 'serverspec'
require 'net/ssh'
require 'type/kafka_producer'
require 'type/kafka_consumer'
require 'type/keystore'
require 'command/keystore'
require 'yaml'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] = "admin"

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options

@config ||= YAML.load_file('cluster.yml')


def kafka_port
  ENV['KAFKA_PORT'] || 9092
end
def kafka_hosts
  @config["kafka"]
end

def zookeeper_hosts
  @config["zookeeper"]
end

def schema_registry_hosts
  @config["schema-registry"]
end

def connect_hosts
  @config["connect"]
end

def control_center_hosts
  @config["control-center"]
end

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
