require 'spec_helper'

describe port(2181) do
  it { should be_listening }
end

describe package('confluent-kafka-2.12') do
  it { should be_installed }
end


describe service('confluent-zookeeper') do
  it { should be_enabled }
  it { should be_running }
end
