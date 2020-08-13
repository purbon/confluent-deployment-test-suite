require 'spec_helper'

describe port(8083) do
  it { should be_listening }
end

packages = %w(
  confluent-common
  confluent-kafka-2.12
  confluent-kafka-connect-elasticsearch
  confluent-kafka-connect-jdbc
  confluent-kafka-connect-jms
  confluent-kafka-connect-replicator
  confluent-kafka-connect-s3
  confluent-kafka-connect-storage-common
  confluent-security
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe service('confluent-kafka-connect') do
  it { should be_enabled }
  it { should be_running }
end
