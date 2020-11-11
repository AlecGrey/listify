class User < ApplicationRecord
    has_secure_password

    has_many :grocery_lists, dependent: :destroy

    validates :name, presence: true
    validates :name, uniqueness: true

end
