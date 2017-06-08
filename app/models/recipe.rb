# frozen_string_literal: true
#
class Recipe < ApplicationRecord
  belongs_to :user
  has_one :picture, dependent: :destroy
  validates :title, :ingredient_list, :directions, presence: true
end
