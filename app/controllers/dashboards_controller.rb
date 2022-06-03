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
    @active_counting_station =  @counting_stations.find_by(id: params[:counting_station_id]) || @counting_stations.first
    active_tab = params[:active_main_tab] || counting_station_active_main_tab
    @counting_stations_tabs = counting_stations_tabs(active_tab, @active_counting_station&.id)
    @counting_station_active_main_tab = "dashboards/mainbar/counting_station/#{active_tab}.html.erb"
    @counting_station_active_main_tab_locals = counting_station_active_main_tab_locals(@active_counting_station&.id)
  end

  def by_candidate
    @candidates = Candidate.all
    @active_candidate = @candidates.find_by(id: params[:candidate_id]) || @candidates.first
    active_tab = params[:active_main_tab] || candidate_active_main_tab
    @candidates_tabs = candidates_tabs(active_tab, @active_candidate&.id)
    @candidate_active_main_tab = "dashboards/mainbar/candidate/#{active_tab}.html.erb"
    @candidate_active_main_tab_locals = candidate_active_main_tab_locals(@active_candidate&.id)
  end

  def by_electoral_position
    @electoral_positions = ElectoralPosition.all
    @active_electoral_position = @electoral_positions.find_by(id: params[:electoral_position_id]) || @electoral_positions.first
    active_tab = params[:active_main_tab] || electoral_position_active_main_tab
    @electoral_positions_tabs = electoral_positions_tabs(active_tab, @active_electoral_position&.id)
    @electoral_position_active_main_tab = "dashboards/mainbar/electoral_position/#{active_tab}.html.erb"
    @electoral_position_active_main_tab_locals = electoral_position_active_main_tab_locals(@active_electoral_position&.id)
  end

  def by_election_period
    @election_periods = ElectionPeriod.all
    @active_election_period = @election_periods.find_by(id: params[:election_period_id]) || @election_periods.first
    active_tab = params[:active_main_tab] || election_period_active_main_tab
    @election_periods_tabs = election_periods_tabs(active_tab, @active_election_period&.id)
    @election_period_active_main_tab = "dashboards/mainbar/election_period/#{active_tab}.html.erb"
    @election_period_active_main_tab_locals = election_period_active_main_tab_locals(@active_election_period&.id)
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

    def tab_data
      Struct.new(:link, :content, :active, keyword_init: true)
    end

    def tab_type
      Struct.new(:one, :two, :three, :four, :five, keyword_init: true)
    end

    def candidates_tabs(active_tab, candidate_id)
      tab_type.new(
        one: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_candidate', active_main_tab: 'votes_stream',
            candidate_id: candidate_id
          )}",
          content: 'Votes stream',
          active: active_tab == "votes_stream" ? true : false
        ),
        two: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_candidate', active_main_tab: 'votes_bar_graph',
            candidate_id: candidate_id
          )}",
          content: 'Votes bar graph',
          active: active_tab == "votes_bar_graph" ? true : false
        ),
        three: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_candidate', active_main_tab: 'votes_time_series',
            candidate_id: candidate_id
          )}",
          content: 'Votes time series',
          active: active_tab == "votes_time_series" ? true : false
        ),
        four: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_candidate', active_main_tab: 'votes_pie_chart',
            candidate_id: candidate_id
          )}",
          content: 'Votes pie chart',
          active: active_tab == "votes_pie_chart" ? true : false
        ),
        five: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_candidate', active_main_tab: 'settings',
            candidate_id: candidate_id
          )}",
          content: 'Settings',
          active: active_tab == "settings" ? true : false
        ),
      )
    end

    def counting_stations_tabs(active_tab, counting_station_id)
      tab_type.new(
        one: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_counting_station', active_main_tab: 'votes_stream',
            counting_station_id: counting_station_id
          )}",
          content: 'Votes stream',
          active: active_tab == "votes_stream" ? true : false
        ),
        two: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_counting_station', active_main_tab: 'votes_bar_graph',
            counting_station_id: counting_station_id
          )}",
          content: 'Votes bar graph',
          active: active_tab == "votes_bar_graph" ? true : false
        ),
        three: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_counting_station', active_main_tab: 'votes_time_series',
            counting_station_id: counting_station_id
          )}",
          content: 'Votes time series',
          active: active_tab == "votes_time_series" ? true : false
        ),
        four: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_counting_station', active_main_tab: 'votes_pie_chart',
            counting_station_id: counting_station_id
          )}",
          content: 'Votes pie chart',
          active: active_tab == "votes_pie_chart" ? true : false
        ),
        five: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_counting_station', active_main_tab: 'settings',
            counting_station_id: counting_station_id
          )}",
          content: 'Settings',
          active: active_tab == "settings" ? true : false
        ),
      )
    end

    def election_periods_tabs(active_tab, election_period_id)
      tab_type.new(
        one: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_election_period', active_main_tab: 'votes_stream',
            election_period_id: election_period_id
          )}",
          content: 'Votes stream',
          active: active_tab == "votes_stream" ? true : false
        ),
        two: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_election_period', active_main_tab: 'votes_bar_graph',
            election_period_id: election_period_id
          )}",
          content: 'Votes bar graph',
          active: active_tab == "votes_bar_graph" ? true : false
        ),
        three: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_election_period', active_main_tab: 'votes_time_series',
            election_period_id: election_period_id
          )}",
          content: 'Votes time series',
          active: active_tab == "votes_time_series" ? true : false
        ),
        four: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_election_period', active_main_tab: 'votes_pie_chart',
            election_period_id: election_period_id
          )}",
          content: 'Votes pie chart',
          active: active_tab == "votes_pie_chart" ? true : false
        ),
        five: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_election_period', active_main_tab: 'settings',
            election_period_id: election_period_id
          )}",
          content: 'Settings',
          active: active_tab == "settings" ? true : false
        ),
      )
    end

    def electoral_positions_tabs(active_tab, electoral_position_id)
      tab_type.new(
        one: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_electoral_position', active_main_tab: 'votes_stream',
            electoral_position_id: electoral_position_id
          )}",
          content: 'Votes stream',
          active: active_tab == "votes_stream" ? true : false
        ),
        two: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_electoral_position', active_main_tab: 'votes_bar_graph',
            electoral_position_id: electoral_position_id
          )}",
          content: 'Votes bar graph',
          active: active_tab == "votes_bar_graph" ? true : false
        ),
        three: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_electoral_position', active_main_tab: 'votes_time_series',
            electoral_position_id: electoral_position_id
          )}",
          content: 'Votes time series',
          active: active_tab == "votes_time_series" ? true : false
        ),
        four: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_electoral_position', active_main_tab: 'votes_pie_chart',
            electoral_position_id: electoral_position_id
          )}",
          content: 'Votes pie chart',
          active: active_tab == "votes_pie_chart" ? true : false
        ),
        five: tab_data.new(
          link: "#{url_for(
            :controller => 'dashboards', :action => 'by_electoral_position', active_main_tab: 'settings',
            electoral_position_id: electoral_position_id
          )}",
          content: 'Settings',
          active: active_tab == "settings" ? true : false
        ),
      )
    end

    def tab_class(is_active)
      if is_active
        "px-3 border-b-2 border-blue-500 text-blue-500 dark:text-white dark:border-white pb-1.5"
      else
        "px-3 border-b-2 border-transparent text-gray-600 dark:text-gray-400 pb-1.5"
      end
    end
  
    def electoral_position_active_main_tab
      "dashboards/mainbar/electoral_position/votes_stream.html.erb"
    end
  
    def electoral_position_active_main_tab_locals(electoral_position_id)
      votes = Votes.where(electoral_position_id: electoral_position_id)
      { votes: votes }
    end
  
    def election_period_active_main_tab
      "dashboards/mainbar/election_period/votes_stream.html.erb"
    end

    def election_period_active_main_tab_locals(election_period_id)
      votes = Votes.where(election_period_id: election_period_id)
      { votes: votes }
    end
  
    def counting_station_active_main_tab
      "dashboards/mainbar/counting_station/votes_stream.html.erb"
    end
  
    def counting_station_active_main_tab_locals(counting_station_id)
      votes = Votes.where(counting_station_id: counting_station_id)
      { votes: votes }
    end
  
    def candidate_active_main_tab
      "votes_stream"
    end
  
    def candidate_active_main_tab_locals(candidate_id)
      votes = Votes.where(candidate_id: candidate_id)
      { votes: votes }
    end
end
