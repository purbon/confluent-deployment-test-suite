require "kafka"

module Serverspec
  module Type

    class KafkaProducer < Base

      def initialize(brokers)
        super("Kafka Producer #{brokers}")
        @brokers = brokers
        @config = { ssl_ca_cert: ::File.read('certs/ca_cert.pem'),
                    ssl_client_cert: ::File.read('certs/client_cert.pem'),
                    ssl_client_cert_key: ::File.read('certs/client_cert_key.pem'),
                    ssl_verify_hostname: false
                  }
      end

      def valid?
        @valid = true
        begin
          kafka = Kafka.new([@brokers], **@config)
          producer = kafka.producer
          10.times do |i|
            producer.produce("test-message#{i}", topic: "test-topic")
          end
          producer.deliver_messages
        rescue => e
          @valid = false
          raise e
        ensure
          producer.shutdown
        end
        @valid
      end

    end

    def kafka_producer(brokers)
      KafkaProducer.new(brokers)
    end
  end
end

include Serverspec::Type
