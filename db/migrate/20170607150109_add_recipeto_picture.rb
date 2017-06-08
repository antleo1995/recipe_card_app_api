class AddRecipetoPicture < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :recipe, foreign_key: true, on_delete: :cascade
  end
end
