require 'spec_helper'

describe user('cp-kafka') do
  it { should exist }
  it { should belong_to_group 'confluent' }
end

describe file('/var/lib/kafka/data') do
  it { should be_directory }
  it { should be_owned_by 'cp-kafka' }
  it { should be_grouped_into 'confluent' }
  it { should be_readable }
  it { should be_writable }
end

describe file('/var/log/kafka') do
  it { should be_directory }
  it { should be_owned_by 'cp-kafka' }
  it { should be_grouped_into 'confluent' }
  it { should be_writable }
end

describe file('/etc/kafka/server.properties') do
  it { should be_file }
  it { should be_owned_by 'cp-kafka' }
  it { should be_grouped_into 'confluent' }
end

describe command("systemctl show confluent-server | grep LimitNOFILE") do
  its(:exit_status) { should eq 0 }
  its(:stdout)      { should eq "LimitNOFILE=500000\n" }
end
