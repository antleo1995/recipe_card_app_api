# frozen_string_literal: true
#
class Picture < ApplicationRecord
  belongs_to :recipe
  validates :url, presence: true
  validates :recipe_id, :uniqueness => { :scope => :recipe_id }
end
