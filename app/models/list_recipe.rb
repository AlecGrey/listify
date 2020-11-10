class ListRecipe < ApplicationRecord

  belongs_to :grocery_list
  belongs_to :recipe
  
end
