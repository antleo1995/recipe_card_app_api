class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, :ingredient_list, :directions, presence: true
end
