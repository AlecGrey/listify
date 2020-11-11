class CreateGroceryLists < ActiveRecord::Migration[6.0]
  def change
    create_table :grocery_lists do |t|
      t.string :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
