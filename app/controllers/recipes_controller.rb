class RecipesController < ApplicationController
  before_action :check_for_user, :only => [:new, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    @categories = Category.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # recipe = Recipe.create recipe_params
    recipe = @current_user.recipes.create recipe_params
    if params[:file].present?
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:file])
    # Using the public_id allows us to use Cloudinary's powerful image transformation methods.
    recipe.image = req["public_id"]
    recipe.save
    redirect_to recipe
    end
  end
  def edit
    @recipe = Recipe.find params[:id]
    redirect_to recipe_path( @recipe.id ) unless @recipe.user.id == @current_user.id
  end

  def show
    @recipe = Recipe.find params[:id]
    @categories = Category.all
  end

  def update
    @recipe = Recipe.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      recipe.image = req["public_id"]
    end
    @recipe.update_attributes(recipe_params)
    recipe.save
    redirect_to recipe_path( @recipe.id )
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :image, :video, :servings, :preparation_time, :ingredients, :method, :tips)
    end
    def category_params
      params.require(:category).permit(:category_id)
    end
  end
