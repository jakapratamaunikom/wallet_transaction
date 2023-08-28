class AddColumnsInCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :full_name, :string
    add_column :customers, :username, :string
    add_column :customers, :is_active, :boolean
    add_column :customers, :born_date, :date
    add_column :customers, :email, :string


  end
end
