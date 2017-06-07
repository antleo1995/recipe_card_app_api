# frozen_string_literal: true
#
class PictureSerializer < ActiveModel::Serializer
  attributes :id, :url, :recipe

  def recipe
    object.recipe.id
  end
end
