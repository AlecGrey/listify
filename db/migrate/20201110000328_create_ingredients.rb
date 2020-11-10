class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.integer :quantity
      t.string :quantity_type
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
