# frozen_string_literal: true
#
class Recipe < ApplicationRecord
  belongs_to :user
  has_one :picture
  validates :title, :ingredient_list, :directions, presence: true
end
