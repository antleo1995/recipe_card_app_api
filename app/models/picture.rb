# frozen_string_literal: true
#
class Picture < ApplicationRecord
  belongs_to :recipe
  validates :url, presence: true
  validates :url, :uniqueness => { :scope => :recipe_id }
end
