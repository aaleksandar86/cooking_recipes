class IngredientsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_ingredient, except: [:index, :new, :create]
  before_action :find_recipe, except: [:index, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)
    @ingredient.user = current_user

    if @ingredient.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to @ingredient.recipe
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name)
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def find_recipe
    @recipe = @ingredient.recipe
  end

  def correct_user
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path)
    end
  end
end
