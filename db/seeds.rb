# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../config/environment.rb'

User.destroy_all
Food.destroy_all
GroceryList.destroy_all
Ingredient.destroy_all
ListRecipe.destroy_all
Recipe.destroy_all

until Food.all.count == 50
    food = Food.new(name: Faker::Food.ingredient)
    food.save
end

until Recipe.all.count == 20
    recipe = Recipe.new(name: Faker::Food.dish, description: Faker::Food.description)
    recipe.save
end

Recipe.all.each do |recipe|

    ingredients_number = rand(5..10)

    until recipe.ingredients.count == ingredients_number

        food = Food.all.sample
        quant = Faker::Food.measurement

        recipe.add_ingredient(food, quant)
    end
end