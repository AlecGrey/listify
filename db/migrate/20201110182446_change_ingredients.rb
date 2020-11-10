class ChangeIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_columns :ingredients, :quantity, :quantity_type
    add_column :ingredients, :quantity, :string
  end
end
