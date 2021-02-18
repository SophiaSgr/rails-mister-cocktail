class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path(@cocktail) # ROUTE
    else
      render :new
    end
  end

  private

  def doses_params
    params.require(:dose).permit(:description)
  end
end
