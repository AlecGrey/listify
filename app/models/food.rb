class Food < ApplicationRecord

    has_many :ingredients, dependent: :destroy
    has_many :recipes, through: :ingredients

    validates :name, uniqueness: true

end
