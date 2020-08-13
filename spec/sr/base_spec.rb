require 'spec_helper'

kafka_hosts.each do |host|
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

schema_registry_hosts.each do |host|
  describe command("curl -k https://#{host}:8081") do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /{}/ }
  end

end
