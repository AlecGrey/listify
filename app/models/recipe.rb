class Recipe < ApplicationRecord

    has_many :ingredients, dependent: :destroy
    has_many :foods, through: :ingredients

    has_many :list_recipes, dependent: :destroy
    has_many :grocery_lists, through: :list_recipes

    validates :name, uniqueness: true

end
