require 'spec_helper'

describe port(8081) do
  it { should be_listening }
end

packages = %w(
  confluent-common
  confluent-rest-utils
  confluent-schema-registry
  confluent-security
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe service('confluent-schema-registry') do
  it { should be_enabled }
  it { should be_running }
end
