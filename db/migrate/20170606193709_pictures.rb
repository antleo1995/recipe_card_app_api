class Pictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :recipes, foreign_key: true
  end
end
