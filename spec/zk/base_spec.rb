require 'spec_helper'

zookeeper_hosts.each do |zk_host|
  describe host(zk_host) do
    it { should be_reachable }
    it { should be_reachable.with( :port => 22 ) }
    it { should be_reachable.with( :port => 2181 ) }
    it { should be_resolvable }
  end
end
