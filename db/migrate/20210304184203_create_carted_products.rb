class CreateCartedProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :carted_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end
end
