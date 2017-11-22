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
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cuisine_id, :recipe_type, :servings,
                                   :cook_time, :difficulty, :ingredients,
                                   :method)
  end
end
