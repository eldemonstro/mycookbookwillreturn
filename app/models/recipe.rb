class Recipe < ApplicationRecord
  validates :title, :cuisine, :recipe_type, :ingredients, :method,
            presence: true

  belongs_to :cuisine
end
