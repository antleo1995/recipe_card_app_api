class AddPictureidToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :picture_id, :string
  end
end
