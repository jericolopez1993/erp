class AddCustomerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :customer_id, :integer
  end
end
