class Recipe < ApplicationRecord

    has_many :ingredients, dependent: :destroy
    has_many :foods, through: :ingredients

    has_many :list_recipes, dependent: :destroy
    has_many :grocery_lists, through: :list_recipes

    validates :name, uniqueness: true
    validates :description, presence: true

    def add_ingredient(food_obj, quantity)
        attrs = {
            :recipe_id => self.id,
            :food_id => food_obj.id,
            :quantity => quantity
        }
        ingredient = Ingredient.new(attrs)
        if ingredient.save
            self.ingredients << ingredient
        else
            return false
        end
    end
end
