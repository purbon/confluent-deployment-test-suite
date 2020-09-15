require 'spec_helper'

describe "topic level acls should" do

  @command="kafka-acls --bootstrap-server #{ENV['TARGET_HOST']}:#{kafka_port} --command-config /root/client.conf --list"
  @fixtures = Dir.glob("spec/fixtures/acls/*")
  @topic_map = @fixtures.map do |f|
     [ f.split("/").last.split(".").first, f.split("/").last ]
  end.flatten

  Hash[*@topic_map].each_pair do |k,v|
    @cmd = "#{@command} --topic #{k}"
    describe command(@cmd) do
      result = File.read("spec/fixtures/acls/#{v}")
      it "should match stdout" do
        stdout = subject.stdout.gsub(/\n|\s/, "")
        expect(stdout).to eq result.gsub(/\n|\s/, "")
      end
    end
  end

end

describe "global level acls should" do

  @command="kafka-acls --bootstrap-server #{ENV['TARGET_HOST']}:#{kafka_port} --command-config /root/client.conf --list"
  @fixture = File.read("spec/fixtures/global-acls.fixture")

  describe command(@command) do
      xit "should match stdout" do
        stdout = subject.stdout.gsub(/\n|\s/, "")
        expect(stdout).to eq @fixture.gsub(/\n|\s/, "")
      end
    end
  end

end
