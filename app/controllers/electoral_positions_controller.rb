class ElectoralPositionsController < ApplicationController
  before_action :set_electoral_position, only: %i[ show edit update destroy ]

  # GET /electoral_positions or /electoral_positions.json
  def index
    @electoral_positions = ElectoralPosition.all
  end

  # GET /electoral_positions/1 or /electoral_positions/1.json
  def show
  end

  # GET /electoral_positions/new
  def new
    @electoral_position = ElectoralPosition.new
  end

  # GET /electoral_positions/1/edit
  def edit
  end

  # POST /electoral_positions or /electoral_positions.json
  def create
    @electoral_position = ElectoralPosition.new(electoral_position_params)

    respond_to do |format|
      if @electoral_position.save
        format.html { redirect_to electoral_position_url(@electoral_position), notice: "Electoral position was successfully created." }
        format.json { render :show, status: :created, location: @electoral_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @electoral_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electoral_positions/1 or /electoral_positions/1.json
  def update
    respond_to do |format|
      if @electoral_position.update(electoral_position_params)
        format.html { redirect_to electoral_position_url(@electoral_position), notice: "Electoral position was successfully updated." }
        format.json { render :show, status: :ok, location: @electoral_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @electoral_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electoral_positions/1 or /electoral_positions/1.json
  def destroy
    @electoral_position.destroy

    respond_to do |format|
      format.html { redirect_to electoral_positions_url, notice: "Electoral position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electoral_position
      @electoral_position = ElectoralPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def electoral_position_params
      params.require(:electoral_position).permit(:name, :jurisdiction)
    end
end
