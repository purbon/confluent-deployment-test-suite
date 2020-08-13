require 'spec_helper'

describe port(9092) do
  it { should be_listening }
end

packages = %w(
  confluent-common
  confluent-metadata-service
  confluent-rebalancer
  confluent-rest-utils
  confluent-security
  confluent-server
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe service('confluent-server') do
  it { should be_enabled }
  it { should be_running }
end
