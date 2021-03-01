class ChangeDescriptionColumnToMaterial < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :description, :text
    add_column :products, :materials, :text
  end
end
