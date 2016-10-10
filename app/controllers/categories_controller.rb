class CategoriesController < ApplicationController
  def index
    @categories = Category.all.by_name
  end




  private
    def category_params
      params.require(:category).permit(:recipe_type)
    end
end
