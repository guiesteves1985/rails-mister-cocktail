class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      # alternative: redirect_to @garden
      redirect_to cocktail_path(@cocktail)
      # ,
      #             notice: "dose #{@dose.description} added to cocktail"

    else
      render :new
    end

    def destroy
      @dose = Dose.find(params[:id])
      @dose.destroy
    redirect_to cocktails_path
    end


end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
