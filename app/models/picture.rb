# frozen_string_literal: true
#
class Picture < ApplicationRecord
  belongs_to :recipe
  validates :url, presence: true
end
