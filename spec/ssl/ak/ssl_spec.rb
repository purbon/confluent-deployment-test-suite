require 'spec_helper'

describe file('/var/ssl/private/kafka_broker.keystore.jks') do
  it { should be_file }
  it { should_not be_readable.by("cp-kafka") }
end

describe file('/var/ssl/private/kafka_broker.truststore.jks') do
  it { should be_file }
  it { should_not be_readable.by("cp-kafka") }
end

describe key_store('/var/ssl/private/kafka_broker.keystore.jks',
                  'confluentkeystorestorepass') do

  expression = /CN=ak(\d+)\.gcp\.cp\.com, OU=TEST, O=CONFLUENT, L=PaloAlto, ST=Ca, C=US/
  it { should be_valid_private_key }
  it { should be_valid_ca_record }
  it { should be_valid_store_type }
  it { should be_valid_subject(expression)}

end
