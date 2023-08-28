class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :type
      t.decimal :amount, precision: 8, scale: 2, default: 0, null: false
      t.integer :sender_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true
      t.timestamps
    end
  end
end
