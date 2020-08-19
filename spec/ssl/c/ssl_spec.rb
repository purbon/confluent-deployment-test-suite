require 'spec_helper'

describe file('/var/ssl/private/control_center.keystore.jks') do
  it { should be_file }
  it { should_not be_readable.by("cp-control-center") }
end

describe file('/var/ssl/private/control_center.truststore.jks') do
  it { should be_file }
  it { should_not be_readable.by("cp-control-center") }
end

describe key_store('/var/ssl/private/control_center.keystore.jks',
                  'confluentkeystorestorepass') do

  expression = /CN=c3\.gcp\.cp\.com, OU=TEST, O=CONFLUENT, L=PaloAlto, ST=Ca, C=US/
  it { should be_valid_private_key }
  it { should be_valid_ca_record }
  it { should be_valid_store_type }
  it { should be_valid_subject(expression)}

end
