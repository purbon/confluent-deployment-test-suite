require 'spec_helper'

describe file('/var/ssl/private/schema_registry.keystore.jks') do
  it { should be_file }
  it { should_not be_readable.by("cp-schema-registry") }
end

describe file('/var/ssl/private/schema_registry.truststore.jks') do
  it { should be_file }
  it { should_not be_readable.by("cp-schema-registry") }
end

describe key_store('/var/ssl/private/schema_registry.keystore.jks',
                  'confluentkeystorestorepass') do

  expression = /CN=sr(\d+)\.gcp\.cp\.com, OU=TEST, O=CONFLUENT, L=PaloAlto, ST=Ca, C=US/
  it { should be_valid_private_key }
  it { should be_valid_ca_record }
  it { should be_valid_store_type }
  it { should be_valid_subject(expression)}

end
