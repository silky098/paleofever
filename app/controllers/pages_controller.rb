class PagesController < ApplicationController
  def home
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :image, :video, :servings, :preparation_time, :ingredients, :method, :tips)
  end
end
