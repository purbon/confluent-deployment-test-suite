require 'spec_helper'

describe kafka_producer("#{ENV['TARGET_HOST']}:9092") do
  it { should be_valid }
end

describe kafka_consumer("#{ENV['TARGET_HOST']}:9092", "test-topic") do
  it { should be_valid }
end
