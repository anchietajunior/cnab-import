module Transactions
  module Imports
    class TransactionsService < ApplicationService

      def initialize(file)
        @file = file
      end

      def call
        # binding.pry
        Result.new(true, nil, import!)
      rescue StandardError => e
        Result.new(false, e.message, nil)
      end

      private

      attr_reader :file

      def import!
        file.lines.each do |transaction|
          create_transaction(transaction)
        end
      end

      def create_transaction(transaction)
        Transaction.create!(formatted_params(transaction))
      end

      def formatted_params(transaction)
        Transactions::Parsers::TransactionService.call(transaction)
      end
    end
  end
end
