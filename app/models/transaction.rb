class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :transaction_type

  validates :transaction_type, :store, :amount, :card, :cpf, :traded_at, presence: true
end
