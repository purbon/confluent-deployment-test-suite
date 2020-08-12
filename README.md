# A framework to test a Confluent Platform deployment

Because we test everything!


## 7. Create PEM files for Ruby client
### 7.1 Extract signed client certificate
keytool -noprompt -keystore client.keystore.jks -exportcert -alias ak1.gcp.cp.com -rfc -storepass confluentkeystorestorepass -file client_cert.pem
### 7.2 Extract client key
keytool -noprompt -srckeystore client.keystore.jks -importkeystore -srcalias ak1.gcp.cp.com -destkeystore cert_and_key.p12 -deststoretype PKCS12 -srcstorepass confluentkeystorestorepass -storepass confluentkeystorestorepass

openssl pkcs12 -in cert_and_key.p12 -nocerts -nodes -passin pass:confluentkeystorestorepass -out client_cert_key.pem


### 7.3 Extract CA certificate
keytool -noprompt -keystore client.keystore.jks -exportcert -alias caroot -rfc -file ca_cert.pem -storepass confluentkeystorestorepass

keytool -v -list -keystore /var/ssl/private/client.keystore.jks -storepass confluentkeystorestorepass
