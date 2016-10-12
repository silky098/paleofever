class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def create
    @recipe = Recipe.find params[:recipe_id]
    @recipe.favourites.create :user => @current_user
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find params[:recipe_id]
    @recipe.favourites.where(:user_id => @current_user.id).destroy_all
    redirect_to @recipe
  end

end
