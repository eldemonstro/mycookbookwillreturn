class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound => r
    puts r
    flash[:alert] = 'Receita não existente'
    redirect_to root_path
  end
end
