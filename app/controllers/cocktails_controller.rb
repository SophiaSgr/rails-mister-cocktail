class CocktailsController < ApplicationController

  def index
   @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new(cocktail_params)
  end

  def create
    @cocktail = Cocktail.new(cocktail.params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def cocktail_params
  params.require(:cocktail).permit(:name)
  end
end
