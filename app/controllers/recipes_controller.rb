class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create recipe_params
    redirect_to recipe
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  # '
  # def update
  #   artist = Artist.find params[:id]
  #   artist.update artist_params
  #   redirect_to artist
  # end
  #
  #
  # def destroy
  #   artist = Artist.find params[:id]
  #   artist.destroy
  #   redirect_to artists_path
  # end'

  private
    def recipe_params
      params.require(:recipe).permit(:name, :image, :video, :servings, :preparation_time, :ingredients, :method, :tips)
    end
  end
