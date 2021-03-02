class DropCategories < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :categories
    end
  end
end
