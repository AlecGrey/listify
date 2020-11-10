class ChangeQuantityInIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :quantity, :decimal
  end
end
