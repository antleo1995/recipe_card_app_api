class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredient_list
      t.string :directions
      t.string :prep_time

      t.timestamps
    end
  end
end
