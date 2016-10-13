class RecipesController < ApplicationController
  before_action :check_for_user, :only => [:new, :edit, :update, :destroy]


  def search
    # raise 'hell'
    if params[:search]
      @recipes = Recipe.search(params[:search]).order("created_at DESC")
    else
      @recipes = Recipe.all.order('created_at DESC')
    end
  end

  def index
    @categories = Category.all
    @recipes = Recipe.all

  end

  def new
    @recipe = Recipe.new
  end


  def create
  # recipe = Recipe.create recipe_params
  @recipe = @current_user.recipes.new recipe_params
  if params[:file].present?
    # Then call Cloudinary's upload method, passing in the file in params
    req = Cloudinary::Uploader.upload(params[:file])
  # Using the public_id allows us to use Cloudinary's powerful image transformation methods.
    @recipe.image = req["public_id"]
    @recipe.save
    redirect_to @recipe
  else
    flash[:error] = "Error"
    render 'new'
  end
end

    def edit
      @recipe = Recipe.find params[:id]
      redirect_to recipe_path( @recipe.id ) unless @recipe.user.id == @current_user.id
    end

  def show
    @recipe = Recipe.find params[:id]
    @categories = Category.all
    @current_user = User.find_by :id => session[:user_id]
  end

  def update
    @recipe = Recipe.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])

      recipe.image = req["public_id"]
    end
    @recipe.update_attributes(recipe_params)
    @recipe.save
    redirect_to recipe_path( @recipe.id )
  end

  def destroy
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
    recipe.destroy
    end
    redirect_to recipes_path  
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :image, :video, :servings, :preparation_time, :ingredients, :method, :tips, :category_id)
    end
    def category_params
      params.require(:category).permit(:category_id, :recipe_type)
    end
  end
