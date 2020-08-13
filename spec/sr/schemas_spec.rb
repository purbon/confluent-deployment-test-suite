require 'spec_helper'

schema_registry_hosts.each do |host|
  create_schema_cmd = %{
    curl -X POST --insecure -H "Content-Type: application/vnd.schemaregistry.v1+json" \
        --data '{"schema": "{\"type\": \"string\"}"}' \
        https://#{host}:8081/subjects/Kafka-key/versions
   }

   describe command(create_schema_cmd) do
     its(:exit_status) { should eq 0 }
   end

   read_schema_cmd = %{
     curl -X GET http://#{host}:8081/subjects/Kafka-value/versions
    }

    describe command(read_schema_cmd) do
      its(:exit_status) { should eq 0 }
    end

end
