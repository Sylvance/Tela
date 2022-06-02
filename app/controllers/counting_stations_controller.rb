class CountingStationsController < ApplicationController
  before_action :set_counting_station, only: %i[ show edit update destroy ]

  # GET /counting_stations or /counting_stations.json
  def index
    @counting_stations = CountingStation.all
  end

  # GET /counting_stations/1 or /counting_stations/1.json
  def show
  end

  # GET /counting_stations/new
  def new
    @counting_station = CountingStation.new
  end

  # GET /counting_stations/1/edit
  def edit
  end

  # POST /counting_stations or /counting_stations.json
  def create
    @counting_station = CountingStation.new(counting_station_params)

    respond_to do |format|
      if @counting_station.save
        format.html { redirect_to counting_station_url(@counting_station), notice: "Counting station was successfully created." }
        format.json { render :show, status: :created, location: @counting_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @counting_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counting_stations/1 or /counting_stations/1.json
  def update
    respond_to do |format|
      if @counting_station.update(counting_station_params)
        format.html { redirect_to counting_station_url(@counting_station), notice: "Counting station was successfully updated." }
        format.json { render :show, status: :ok, location: @counting_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @counting_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counting_stations/1 or /counting_stations/1.json
  def destroy
    @counting_station.destroy

    respond_to do |format|
      format.html { redirect_to counting_stations_url, notice: "Counting station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counting_station
      @counting_station = CountingStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def counting_station_params
      params.require(:counting_station).permit(:name, :location)
    end
end
