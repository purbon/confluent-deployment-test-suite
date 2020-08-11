require 'spec_helper'

describe kafka_producer("ak1.gcp.cp.com:9092") do
  it { should be_valid }
end

describe kafka_consumer("ak1.gcp.cp.com:9092", "test-topic") do
  it { should be_valid }
end
