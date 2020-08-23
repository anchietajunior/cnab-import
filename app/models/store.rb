class Store < ApplicationRecord
  has_many :transactions

  validates :name, :owner_name, presence: true
end
