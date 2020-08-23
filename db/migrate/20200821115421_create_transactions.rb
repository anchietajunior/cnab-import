class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :store, null: false, foreign_key: true
      t.references :transaction_type, null: false, foreign_key: true
      t.datetime :traded_at
      t.decimal :amount
      t.string :cpf
      t.string :card

      t.timestamps
    end
  end
end
