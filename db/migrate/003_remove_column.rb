class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :carts, :line_item_id
  end 
end