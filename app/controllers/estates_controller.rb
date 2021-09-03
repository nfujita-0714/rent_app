class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  # GET /estates or /estates.json
  def index
    @estates = Estate.all
  end

  # GET /estates/1 or /estates/1.json
  def show
    @estate = Estate.find(params[:id])
    @stations = @estate.stations
  end

  # GET /estates/new
  def new
    @estate = Estate.new
    2.times {@estate.stations.build}
  end

  # GET /estates/1/edit
  def edit
    @estate.stations.build
    @estates = Station.all
  end

  def create
  @estate = Estate.new(estate_params)
  if @estate.save
    flash[:notice] = "登録が完了しました！"
    redirect_to estate_path(@estate.id)
  else
    render :new
  end
end

  def update
    respond_to do |format|
      if @estate.update(estate_params)
        format.html { redirect_to @estate, notice: "正常に更新されました！" }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: "情報を削除しました！" }
      format.json { head :no_content }
    end
  end

  private
  def set_estate
      @estate = Estate.find(params[:id])
  end

  def estate_params
      params.require(:estate).permit(:name, :price, :adress, :year, :content, stations_attributes: [:route, :station_name, :walk, :estate_id])
  end
end
