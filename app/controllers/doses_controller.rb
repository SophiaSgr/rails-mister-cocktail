class DosesController < ApplicationController
  def new
    @doses = Doses.new

  end

  def create
    @cocktail = Cocktail.find(params[:garden_id])
    @dose = Dose.new(plant_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path(@cocktail) # ROUTE
    else
      render "cocktails/show"
    end
  end

  private

  def doses_params
    params.require
  end
end
