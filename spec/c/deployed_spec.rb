require 'spec_helper'

describe port(9021) do
  it { should be_listening }
end

packages = %w(
  confluent-common
  confluent-metadata-service
  confluent-rebalancer
  confluent-rest-utils
  confluent-server
  confluent-control-center
  confluent-control-center-fe
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe service('confluent-control-center') do
  it { should be_enabled }
  it { should be_running }
end
