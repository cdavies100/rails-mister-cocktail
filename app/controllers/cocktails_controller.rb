class CocktailsController < ApplicationController
  # before_action :set_cocktail, only: [:index, :show, :new, :create]

  def index
    @cocktails = Cocktail.all
  end

  def show # will work from before_action
    @cocktail = Cocktail.find(params[:id])
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path
  end

  def new
    @cocktail = Cocktail.new()
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save # return false if validations don't pass
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    # def set_cocktail
    #   @cocktail = Cocktail.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :photo, :photo_cache)
    end
end
