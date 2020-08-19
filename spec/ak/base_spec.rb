require 'spec_helper'

kafka_hosts.each do |host|
  describe host(host) do
    it { should be_reachable }
    it { should be_reachable.with( :port => 22 ) }
    it { should be_reachable.with( :port => 9092 ) }
    it { should be_resolvable }
  end
end

zookeeper_hosts.each do |zk_host|
  describe host(zk_host) do
    it { should be_reachable }
    it { should be_reachable.with( :port => 22 ) }
    it { should be_reachable.with( :port => 2181 ) }
    it { should be_resolvable }
  end
end
