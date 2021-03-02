class RemoveProductIdStringAddIntegern < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :product_id, :string
    add_column :categories, :product_id, :integer
  end
end
