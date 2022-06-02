class TalliesController < ApplicationController
  before_action :set_tally, only: %i[ show edit update destroy ]

  # GET /tallies or /tallies.json
  def index
    @tallies = Tally.all
  end

  # GET /tallies/1 or /tallies/1.json
  def show
  end

  # GET /tallies/new
  def new
    @tally = Tally.new
  end

  # GET /tallies/1/edit
  def edit
  end

  # POST /tallies or /tallies.json
  def create
    @tally = Tally.new(tally_params)

    respond_to do |format|
      if @tally.save
        format.html { redirect_to tally_url(@tally), notice: "Tally was successfully created." }
        format.json { render :show, status: :created, location: @tally }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tally.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tallies/1 or /tallies/1.json
  def update
    respond_to do |format|
      if @tally.update(tally_params)
        format.html { redirect_to tally_url(@tally), notice: "Tally was successfully updated." }
        format.json { render :show, status: :ok, location: @tally }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tally.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tallies/1 or /tallies/1.json
  def destroy
    @tally.destroy

    respond_to do |format|
      format.html { redirect_to tallies_url, notice: "Tally was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tally
      @tally = Tally.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tally_params
      params.require(:tally).permit(:candidate_id, :total_count, :counting_station_id)
    end
end
