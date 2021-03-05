class AddUserIdtoCartedProductColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :carted_products, :user_id, :integer
  end
end
