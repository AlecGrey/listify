class Ingredient < ApplicationRecord
  
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true
  validates :food_id, uniqueness: {scope: :recipe_id}

  def quantifier
    # takes in a string such as "1/4 tablespoons"
    # converts to an array such as [0.25, "tablespoons"]
    arr = []
    quant = quantity.split(" ")
    type = quant[1]
    if quant[0].include? "/"
        quant = quant[0].split("/")
        numb = quant[0].to_f / quant[1].to_f
    else
        numb = quant[0].to_f
    end
    arr << numb
    arr << type
  end

  def description
    self.quantity + " " + self.food.name
  end

end
