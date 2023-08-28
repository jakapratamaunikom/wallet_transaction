class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username, uniq: true, null: false
      t.string :full_name, null: false
      t.string :email, uniq: true, null: false
      t.date :born_date


      t.timestamps
    end
  end
end
