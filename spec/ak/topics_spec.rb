require 'spec_helper'

describe "topic creation" do

  admin_user = "/root/client.conf"
  admin_topic_name = "admin.topic.foo"

  non_admin_user = "/root/client.conf"
  non_admin_topic_name = "admin.topic.foo"


  base_command="kafka-topics --bootstrap-server #{ENV['TARGET_HOST']}:#{kafka_port} --command-config"
  admin_topic_attr = "--create --topic #{admin_topic_name} --partitions 3 --replication-factor 3"

  @admin_cmd = "#{base_command} #{admin_user} #{admin_topic_attr}"

  describe command(@admin_cmd) do
     its(:stdout) { should match /Created topic admin.topic.foo/ }
  end

  non_admin_topic_attr = "--create --topic #{non_admin_topic_name} --partitions 3 --replication-factor 3"
  @non_admin_cmd = "#{@base_command} #{non_admin_user} #{non_admin_topic_attr}"

  describe command(@non_admin_cmd) do
     its(:stdout) { should_not match /Created topic admin.topic.foo/ }
  end

end
