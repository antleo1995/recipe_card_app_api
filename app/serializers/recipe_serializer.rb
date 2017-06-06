class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingredient_list, :directions, :prep_time, :editable

  def editable
    scope == object.user
  end
end
