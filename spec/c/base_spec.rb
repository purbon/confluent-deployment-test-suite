require 'spec_helper'

kafka_hosts.each do |host|
  describe host(host) do
    it { should be_reachable }
    it { should be_reachable.with( :port => 22 ) }
    it { should be_reachable.with( :port => 9092 ) }
    it { should be_resolvable }
  end
end

schema_registry_hosts.each do |host|
  describe host(host) do
    it { should be_reachable }
    it { should be_reachable.with( :port => 22 ) }
    it { should be_reachable.with( :port => 8081 ) }
    it { should be_resolvable }
  end
end

connect_hosts.each do |host|
  describe host(host) do
    it { should be_reachable }
    it { should be_reachable.with( :port => 22 ) }
    it { should be_reachable.with( :port => 8083 ) }
    it { should be_resolvable }
  end
end
