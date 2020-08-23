module Stores
  module Balances
    class TotalService < ApplicationService
      def initialize(store_id)
        @store_id = store_id
        @total_balance = 0.0
      end

      def call
        calculate_balance
        Result.new(true, nil, total_balance)
      rescue StandardError => e
        Result.new(false, e.message, nil)
      end

      private

      attr_reader :store_id

      def total_balance
        @total_balance.to_f
      end

      def calculate_balance
        transactions.each do |transaction|
          @total_balance = (@total_balance + transaction.try(:amount)) if sum?(transaction.transaction_type)
          @total_balance = (@total_balance - transaction.try(:amount)) if subtract?(transaction.transaction_type)
        end
      end

      def sum?(transaction_type)
        transaction_type.token == "+"
      end
      
      def subtract?(transaction_type)
        transaction_type.token == "-"
      end

      def transactions
        Transaction.includes(:transaction_type).where(store_id: store_id)
      end
    end
  end
end