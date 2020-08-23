module Transactions
  module Parsers
    class TransactionService < ApplicationService

      def initialize(transaction)
        @transaction = transaction
      end

      def call
        formatted_params
      rescue StandardError => e
        {}
      end

      private

      attr_reader :transaction

      def formatted_params
        {}.tap do |hash|
          hash[:transaction_type] = transaction_type
          hash[:store] = store
          hash[:amount] = formatted_amount
          hash[:cpf] = cpf
          hash[:card] = card
          hash[:traded_at] = formatted_datetime
        end
      end

      def formatted_amount
        transaction[9..18].to_i / 100.00
      end
  
      def formatted_datetime
        Time.zone.parse(
          "#{transaction[1..4]}-#{transaction[5..6]}-#{transaction[7..8]} #{transaction[42..43]}:#{transaction[44..45]}:#{transaction[46..47]}"
        )
      end
  
      def transaction_type
        TransactionType.find(transaction[0])
      end
  
      def store
        Store.where(name: transaction[62..80], owner_name: transaction[48..61]).first_or_create
      end

      def cpf
        transaction[19..29]
      end

      def card
        transaction[30..41]
      end
    end
  end
end