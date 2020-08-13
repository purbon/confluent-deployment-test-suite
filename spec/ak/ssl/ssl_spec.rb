require 'spec_helper'

describe file('/var/ssl/private/client.truststore.jks') do
  it { should be_file }
end

describe file('/var/ssl/private/client.keystore.jks') do
  it { should be_file }
end

describe key_store('/var/ssl/private/client.keystore.jks',
                  'confluentkeystorestorepass') do
  it { should be_valid_private_key }
  it { should be_valid_ca_record }
  it { should be_valid_store_type }

end
