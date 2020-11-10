# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../config/environment.rb'

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

def quantifier(faker_str)
    # takes in a string such as "1/2 tablespoons"
    # converts to an array such as [0.25, "tablespoons"]
    arr = []
    quant = faker_str.split(" ")
    type = quant[1]
    if quant[0].include? "/"
        quant = quant[0].split("/")
        numb = quant[0].to_f / quant[1].to_f
    else
        numb = quant[0]
    end
    arr << numb
    arr << type
end

Recipe.all.each do |recipe|

    ingredients_number = rand(5..10)

    until recipe.ingredients.count == ingredients_number

        food = Food.all.sample
        quant = quantifier(Faker::Food.measurement)

        recipe.add_ingredient(food, quant[0], quant[1])
    end
end