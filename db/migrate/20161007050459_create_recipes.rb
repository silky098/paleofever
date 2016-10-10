class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :image
      t.text :video
      t.integer :servings
      t.integer :preparation_time
      t.text :ingredients
      t.text :method
      t.text :tips

      t.timestamps null: false
    end
  end
end
