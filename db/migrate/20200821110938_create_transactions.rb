class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :description
      t.string :kind
      t.string :token

      t.timestamps
    end
  end
end
