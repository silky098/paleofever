class ChangeCategoryTypetoRecipeType < ActiveRecord::Migration
  def change
    rename_column :categories, :type, :recipe_type
  end
end
