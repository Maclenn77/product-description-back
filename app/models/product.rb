class Product < ApplicationRecord
    has_many :description, dependent: :destroy

    validates :name, presence: true

end
