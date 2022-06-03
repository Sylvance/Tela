class DashboardsController < ApplicationController
  before_action :set_dashboard, only: %i[ show edit update destroy ]

  # GET /dashboards or /dashboards.json
  def index
    @dashboards = Dashboard.all
  end

  # GET /dashboards/1 or /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards or /dashboards.json
  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to dashboard_url(@dashboard), notice: "Dashboard was successfully created." }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1 or /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to dashboard_url(@dashboard), notice: "Dashboard was successfully updated." }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1 or /dashboards/1.json
  def destroy
    @dashboard.destroy

    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: "Dashboard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def by_counting_station
    @counting_stations = CountingStation.all
    @active_counting_station = nil
    @counting_stations_tabs = counting_stations_tabs
    @counting_station_active_main_tab = counting_station_active_main_tab
    @counting_station_active_main_tab_locals = counting_station_active_main_tab_locals
  end

  def by_candidate
    @candidates = Candidate.all
    @active_candidate = nil
    @candidates_tabs = candidates_tabs
    @candidate_active_main_tab = candidate_active_main_tab
    @candidate_active_main_tab_locals = candidate_active_main_tab_locals
  end

  def by_electoral_position
    @electoral_positions = ElectoralPosition.all
    @active_electoral_position = nil
    @electoral_positions_tabs = electoral_positions_tabs
    @electoral_position_active_main_tab = electoral_position_active_main_tab
    @electoral_position_active_main_tab_locals = electoral_position_active_main_tab_locals
  end

  def by_election_period
    @election_periods = ElectionPeriod.all
    @active_election_period = nil
    @election_periods_tabs = election_periods_tabs
    @election_period_active_main_tab = election_period_active_main_tab
    @election_period_active_main_tab_locals = election_period_active_main_tab_locals
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dashboard_params
      params.require(:dashboard).permit(:type, :query)
    end
end
