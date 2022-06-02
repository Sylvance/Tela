class ElectionPeriodsController < ApplicationController
  before_action :set_election_period, only: %i[ show edit update destroy ]

  # GET /election_periods or /election_periods.json
  def index
    @election_periods = ElectionPeriod.all
  end

  # GET /election_periods/1 or /election_periods/1.json
  def show
  end

  # GET /election_periods/new
  def new
    @election_period = ElectionPeriod.new
  end

  # GET /election_periods/1/edit
  def edit
  end

  # POST /election_periods or /election_periods.json
  def create
    @election_period = ElectionPeriod.new(election_period_params)

    respond_to do |format|
      if @election_period.save
        format.html { redirect_to election_period_url(@election_period), notice: "Election period was successfully created." }
        format.json { render :show, status: :created, location: @election_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @election_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /election_periods/1 or /election_periods/1.json
  def update
    respond_to do |format|
      if @election_period.update(election_period_params)
        format.html { redirect_to election_period_url(@election_period), notice: "Election period was successfully updated." }
        format.json { render :show, status: :ok, location: @election_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @election_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_periods/1 or /election_periods/1.json
  def destroy
    @election_period.destroy

    respond_to do |format|
      format.html { redirect_to election_periods_url, notice: "Election period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_period
      @election_period = ElectionPeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def election_period_params
      params.require(:election_period).permit(:name, :date)
    end
end
