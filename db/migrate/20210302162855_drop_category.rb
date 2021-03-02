class DropCategory < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :category
    end
  end
end
