class AddRecipetoPicture < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :recipe, foreign_key: true
  end
end
