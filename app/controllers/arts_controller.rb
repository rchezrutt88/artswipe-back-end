class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :update, :destroy]

  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all

    render json: @arts
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    render json: @art
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)

    if @art.save
      render json: @art, status: :created, location: @art
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    if @art.update(art_params)
      head :no_content
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy

    head :no_content
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
