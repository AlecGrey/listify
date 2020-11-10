class ListRecipe < ApplicationRecord

  belongs_to :grocery_list
  belongs_to :recipe

  validates :recipe_id, uniqueness: {scope: :grocery_list_id}
  
end
