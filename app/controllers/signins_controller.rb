class SigninsController < ApplicationController
  before_action :set_signin, only: %i[ show edit update destroy ]

  # GET /signins or /signins.json
  def index
    @signins = Signin.all
  end

  # GET /signins/1 or /signins/1.json
  def show
  end

  # GET /signins/new
  def new
    @signin = Signin.new
  end

  # GET /signins/1/edit
  def edit
  end

  # POST /signins or /signins.json
  def create
    @signin = Signin.new(signin_params)

    respond_to do |format|
      if @signin.save
        format.html { redirect_to signin_url(@signin), notice: "Signin was successfully created." }
        format.json { render :show, status: :created, location: @signin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @signin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signins/1 or /signins/1.json
  def update
    respond_to do |format|
      if @signin.update(signin_params)
        format.html { redirect_to signin_url(@signin), notice: "Signin was successfully updated." }
        format.json { render :show, status: :ok, location: @signin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @signin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signins/1 or /signins/1.json
  def destroy
    @signin.destroy

    respond_to do |format|
      format.html { redirect_to signins_url, notice: "Signin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signin
      @signin = Signin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signin_params
      params.require(:signin).permit(:observer_id, :session_token)
    end
end
