class AddEditableToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :editable, :boolean
  end
end
