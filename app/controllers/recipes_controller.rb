class RecipesController < ApplicationController
  before_action :recipe_find, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def show

  end

  def new
    session_notice(:danger, 'You have to be logged in') unless logged_in?
    @recipe = Recipe.new
    5.times { @recipe.ingredients.build }
    3.times { @recipe.instructions.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'You have successfully created a new recipe'
    else
      render :new
    end
  end

  def edit
    session_notice(:danger, 'You have to be logged in') unless logged_in?
    @recipe = Recipe.find(params[:id])
    if logged_in?
      session_notice(:danger, 'Wrong User') unless equal_with_current_user?(@recipe.user)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    session_notice(:danger, 'You have to be logged in') unless logged_in?
    recipe = Recipe.find(params[:id])
    if equal_with_current_user?(recipe.user)
      recipe.destroy
      redirect_to recipes_path, notice: 'You have successfully deleted the recipe'
    else
      session_notice(:danger, 'Wrong User')
    end
  end

  private

  def recipe_find
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description,ingredients_attributes: [:id, :ingredient_name, :_destroy],
                                  instructions_attributes: [:id, :body, :_destroy])
  end
end
