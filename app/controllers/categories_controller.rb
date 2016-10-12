class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
   @category = Category.find params[:id]
   @categories = Category.all  # for category list partial
   @recipes = Recipe.where :category_id => params[:id]
  #  raise 'hell'
  end

  private
    def category_params
      params.require(:category).permit(:recipe_type)
    end
end
