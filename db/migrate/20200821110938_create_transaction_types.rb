class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.string :description
      t.string :kind
      t.string :token

      t.timestamps
    end
  end
end
