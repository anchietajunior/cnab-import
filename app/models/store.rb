class Store < ApplicationRecord
  has_many :transactions

  validates :name, :owner_name, presence: true

  def total_balance
    Stores::Balances::TotalService.call(self.id).value
  end
end
