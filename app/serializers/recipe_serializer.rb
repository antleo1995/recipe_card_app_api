# frozen_string_literal: true
#
class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingredient_list, :directions, :prep_time, :editable,
            :picture

  def picture
    object.id
  end

  def editable
    scope == object.user
  end
end
