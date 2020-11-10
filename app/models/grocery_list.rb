class GroceryList < ApplicationRecord

    has_many :list_recipes, dependent: :destroy
    has_many :recipes, through: :list_recipes

    validate :finalized_must_be_true_if_date_present

    def finalized_must_be_true_if_date_present
        if date && finalized != true
            errors.add(:finalized, "List must be finalized before a date is added!")
        end
    end

end
