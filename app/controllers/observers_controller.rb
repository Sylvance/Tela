class ObserversController < ApplicationController
  before_action :set_observer, only: %i[ show edit update destroy ]

  # GET /observers or /observers.json
  def index
    @observers = Observer.all
  end

  # GET /observers/1 or /observers/1.json
  def show
  end

  # GET /observers/new
  def new
    @observer = Observer.new
  end

  # GET /observers/1/edit
  def edit
  end

  # POST /observers or /observers.json
  def create
    @observer = Observer.new(observer_params)

    respond_to do |format|
      if @observer.save
        format.html { redirect_to observer_url(@observer), notice: "Observer was successfully created." }
        format.json { render :show, status: :created, location: @observer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observers/1 or /observers/1.json
  def update
    respond_to do |format|
      if @observer.update(observer_params)
        format.html { redirect_to observer_url(@observer), notice: "Observer was successfully updated." }
        format.json { render :show, status: :ok, location: @observer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observers/1 or /observers/1.json
  def destroy
    @observer.destroy

    respond_to do |format|
      format.html { redirect_to observers_url, notice: "Observer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observer
      @observer = Observer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def observer_params
      params.require(:observer).permit(:name, :email, :password_digest)
    end
end
