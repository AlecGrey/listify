class AddFinalizedToGroceryList < ActiveRecord::Migration[6.0]
  def change
    add_column :grocery_lists, :finalized, :boolean, :default => false
  end
end
