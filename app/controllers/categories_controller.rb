class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
   @categories = Category.all
   @category = Category.find params[:id] # for category list partial
   @recipes = Recipe.where :category_id => params[:id]

  end

  private
    def category_params
      params.require(:category).permit(:category_id, :recipe_type, :id)
    end
    def recipe_params
      params.require(:recipe).permit(:category_id)
    end
end
