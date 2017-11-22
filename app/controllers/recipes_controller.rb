class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound => r
    puts r
    flash[:alert] = 'Receita não existente'
    redirect_to root_path
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cuisine, :recipe_type, :servings,
                                   :cook_time, :difficulty, :ingredients,
                                   :method)
  end
end
