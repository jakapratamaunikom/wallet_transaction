class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name, null: false
      t.string :code, uniq: true, null: false
      t.string :stock_type, null: false
      t.decimal :balance, precision: 8, scale: 2, default: 0, null: false


      t.timestamps
    end
  end
end
