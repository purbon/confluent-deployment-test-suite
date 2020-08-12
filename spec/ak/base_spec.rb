require 'spec_helper'

hosts = %w(
  ak0.gcp.cp.com
  ak1.gcp.cp.com
  ak2.gcp.cp.com
  ak3.gcp.cp.com
  ak4.gcp.cp.com
)

hosts.each do |host|
  describe host(host) do
    # ping
    it { should be_reachable }
    # tcp port 22
    it { should be_reachable.with( :port => 22 ) }
    # tcp port 9092
    it { should be_reachable.with( :port => 9092 ) }
    it { should be_resolvable }
  end
end

zk_hosts = %w(
  zk0.gcp.cp.com
  zk1.gcp.cp.com
  zk2.gcp.cp.com
)

zk_hosts.each do |zk_host|
  describe host(zk_host) do
    # ping
    it { should be_reachable }
    # tcp port 22
    it { should be_reachable.with( :port => 22 ) }

    # tcp port 2181
    it { should be_reachable.with( :port => 2181 ) }

    it { should be_resolvable }
  end
end
