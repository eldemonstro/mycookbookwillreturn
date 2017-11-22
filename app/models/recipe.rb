class Recipe < ApplicationRecord
  validates :title, :cuisine, :recipe_type, :ingredients, :method,
            presence: true
end
