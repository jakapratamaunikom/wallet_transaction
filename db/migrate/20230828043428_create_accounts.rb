class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :customer, null: false, foreign_key: true, uniq: true
      t.string :number, unique: true, null: false
      t.decimal :balance, precision: 8, scale: 2, null: false, default: 0

      t.timestamps
    end
  end
end
