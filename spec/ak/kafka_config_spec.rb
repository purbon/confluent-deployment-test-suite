require 'spec_helper'

topics = %w(
  _confluent-metrics
)

topics.each do |topic|
  command="kafka-topics --bootstrap-server #{ENV['TARGET_HOST']}:9092 --command-config /root/client.conf --describe --topic #{topic}"
  describe command(command) do
    its(:stdout) { should match /ReplicationFactor: 3/ }
    its(:stdout) { should match /PartitionCount: 12/ }
    its(:stdout) { should match /min.insync.replicas=2/ }
    its(:stdout) { should match /retention.ms=259200000/ }
  end
end

describe file('/etc/kafka/server.properties') do

  it { should be_file }
  its(:content) { should match /num\.partitions\=1/ }
  its(:content) { should match /broker\.rack/ }
  its(:content) { should match /allow\.everyone\.if\.no\.acl\.found\=false/ }
  its(:content) { should match /delete\.topic\.enable\=false/ }
end
