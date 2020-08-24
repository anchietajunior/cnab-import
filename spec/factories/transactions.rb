FactoryBot.define do
  factory :transaction do
    transaction_type { TransactionType.first }
    store
    amount { 100.0 }
    cpf { "31408241064" }
    card { "6777****1313" }
    traded_at { Time.now }
  end
end
