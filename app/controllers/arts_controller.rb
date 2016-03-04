class ArtsController < ApplicationController
  before_action :set_art, only: [:show]

  def index
    @arts = Art.all

    render json: @arts
  end

  def show
    render json: @art
  end

  def random
    @art = Art.offset(rand(Art.count)).first

    render json: @art
  end

  private

  def set_art
    @art = Art.find(params[:id])
  end

  def art_params
    params.require(:art).permit(:author, :born_died, :title, :date, :technique, :location, :url, :form, :style, :school, :timeframe)
  end

end
