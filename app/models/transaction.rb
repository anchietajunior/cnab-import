class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :transaction_type
end
