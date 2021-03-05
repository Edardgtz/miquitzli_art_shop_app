class AddStatustoCartedProductColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :carted_products, :status, :string
  end
end
