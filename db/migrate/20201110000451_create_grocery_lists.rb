class CreateGroceryLists < ActiveRecord::Migration[6.0]
  def change
    create_table :grocery_lists do |t|
      t.string :date

      t.timestamps
    end
  end
end
