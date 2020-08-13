require 'spec_helper'

topics = %w(
  _confluent-metrics
)

topics.each do |topic|
  command="kafka-topics --bootstrap-server localhost:9092 --command-config /root/client.conf --describe --topic #{topic}"
  describe command(command) do
    xit(:stdout) { should contain('ReplicationFactor:3') }
    xit(:stdout) { should contain('PartitionCount:12') }
    xit(:stdout) { should contain('min.insync.replicas=2') }
    xit(:stdout) { should contain('retention.ms=259200000') }
  end
end

describe file('/etc/kafka/server.properties') do

  it { should be_file }
  its(:content) { should match /num\.partitions\=1/ }
  its(:content) { should match /broker\.rack/ }
  xit(:content) { should match /allow\.everyone\.if\.no\.acl\.found\=false/ }
  xit(:content) { should match /delete\.topic\.enable\=false/ }
end
