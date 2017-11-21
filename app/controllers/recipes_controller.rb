class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    return unless @recipe
    flash[:alert] = 'Receita não existente'
    redirect_to root_path
  end
end
