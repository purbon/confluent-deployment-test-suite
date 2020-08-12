
module Serverspec
  module Type
    class KeyStore < Base

      def initialize(file, password)
        super("Keystore #{file} #{password}")
        @file = file
        @password = password
      end

      def valid_private_key?
        content = @runner.get_keystore_file(@file, @password)
        content.stdout.include?("Entry type: PrivateKeyEntry")
      end

      def valid_ca_record?
        content = @runner.get_keystore_file(@file, @password)
        content.stdout.include?("CA:true")
      end

      def valid_store_type?
        content = @runner.get_keystore_file(@file, @password)
        content.stdout.include?("Keystore type: PKCS12")
      end

    end

    def key_store(file, password)
      KeyStore.new(file, password)
    end
  end
end

include Serverspec::Type
