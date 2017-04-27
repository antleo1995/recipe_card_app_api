class Recipe < ApplicationRecord
  validates :title, :ingredient_list, :directions, presence: true
end
