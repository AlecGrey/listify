class GroceryList < ApplicationRecord

    has_many :list_recipes, dependent: :destroy
    has_many :recipes, through: :list_recipes
    belongs_to :user

    # validate :finalized_must_be_true_if_date_present
    validates :date, presence: true
    validate :date_is_not_past

    def date_is_not_past
        now = Time.new.to_s[0, 10].split('-').join.to_i
        d = date.split('-').join.to_i
        if now > d
            errors.add(:date, "Date cannot be in the past!")
        end
    end

    CONV_TO_TSP = {
        :teaspoon => 1,
        :tablespoon => 3,
        :cup => 49,
        :pint => 98,
        :quart => 194,
        :gallon => 773
    }

    def final_list
        # return array of strings, as "Food - quantity"
        map_to_best_quantity_type.map do |k, v|
            type = v[0].ceil == 1 ? v[1] : v[1].pluralize
            "#{k} - #{v[0].ceil} #{type}"
        end
    end
    
    private
    
    # def finalized_must_be_true_if_date_present
    #     if date && finalized != true
    #         errors.add(:finalized, "List must be finalized before a date is added!")
    #     end
    # end

    def map_to_best_quantity_type
    # convert the food items into the highest logical quantity type, then
    # round to the nearest whole number for the sake of list generation
            reduced_to_tsp.transform_values do |value|
            convert_measurement(value)
        end
    end
    
    def convert_measurement(value)
    # return array where arr[0] is the new measurement
    # and arr[1] is the measurement type
        quant_type = highest_conversion_factor(value)
        factor = CONV_TO_TSP[quant_type]
        converted_value = value.to_f / factor
        [converted_value, quant_type.to_s]
    end
        

    def reduced_to_tsp
    # Convert data structure into accumulated teaspoon measurement
    # for each unique food item
        hash = {}

        recipe_ingredients.each do |key, value|

            hash[key] = value.sum do |quantity|
                quantity[0] * CONV_TO_TSP[quantity[1].to_sym]
            end

        end
        hash
    end


    def recipe_ingredients
    # Take all the grocery list's recipes and construct a hash of
    # ingredients that show all measured quantities as key value pairs:
    # {"pepper" => [[1.0, "cups"], [0.5, "pints"]], etc}
        ing_hash = {}
        self.recipes.each do |recipe|
            recipe.ingredients.each do |ing|
                ing_hash[ing.food.name] = [] if !ing_hash[ing.food.name]
                ing_hash[ing.food.name] << ing.quantifier
            end
        end
        ing_hash
    end

    def highest_conversion_factor(value)
     # search the CONV_TO_TSP constant for the best conversion factor
     # for any given value
        arr = CONV_TO_TSP.find_all do |k, v|
            value >= v
        end
        arr == [] ? CONV_TO_TSP.keys.first : arr.last[0]
    end

end
