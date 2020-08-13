require 'spec_helper'

describe file('/var/ssl/private/client.truststore.jks') do
  it { should be_file }
  xit { should_not be_readable }
end

describe file('/var/ssl/private/client.keystore.jks') do
  it { should be_file }
  xit { should_not be_readable }
end

describe key_store('/var/ssl/private/client.keystore.jks',
                  'confluentkeystorestorepass') do

  subject = "Owner: CN=ak0.gcp.cp.com, OU=TEST, O=CONFLUENT, L=PaloAlto, ST=Ca, C=US"

  it { should be_valid_private_key }
  it { should be_valid_ca_record }
  it { should be_valid_store_type }
  it { should be_valid_subject(subject)}

end
