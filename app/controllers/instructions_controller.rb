class InstructionsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_instruction, except: [:index, :new, :create]
  before_action :find_recipe, except: [:index, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.build
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.build(instruction_params)
    @instruction.user = current_user

    if @instruction.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @instruction.update(instruction_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @instruction.destroy
    redirect_to @instruction.recipe
  end

  private

  def find_instruction
    @instruction = Instruction.find(params[:id])
  end

  def find_recipe
    @recipe = @instruction.recipe
  end

  def instruction_params
    params.require(:instruction).permit(:body)
  end

  def correct_user
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path)
    end
  end
end
