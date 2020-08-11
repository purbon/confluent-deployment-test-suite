require "kafka"

module Serverspec
  module Type

    class KafkaConsumer < Base

      def initialize(brokers, topic)
        super("Kafka Consumer #{brokers}")
        @brokers = brokers
        @topic   = topic
      end

      def valid?
        @total = 0
        consumerThread = Thread.new do
          kafka = Kafka.new(@brokers)
          consumer = kafka.consumer(group_id: "server-spec")
          consumer.subscribe(@topic)
          consumer.each_message do |message|
            @total += 1
          end
        end
        sleep 5
        @total >= 10
      end

    end

    def kafka_consumer(brokers, topics)
      KafkaConsumer.new(brokers, topics)
    end
  end
end

include Serverspec::Type
