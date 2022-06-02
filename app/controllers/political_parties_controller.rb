class PoliticalPartiesController < ApplicationController
  before_action :set_political_party, only: %i[ show edit update destroy ]

  # GET /political_parties or /political_parties.json
  def index
    @political_parties = PoliticalParty.all
  end

  # GET /political_parties/1 or /political_parties/1.json
  def show
  end

  # GET /political_parties/new
  def new
    @political_party = PoliticalParty.new
  end

  # GET /political_parties/1/edit
  def edit
  end

  # POST /political_parties or /political_parties.json
  def create
    @political_party = PoliticalParty.new(political_party_params)

    respond_to do |format|
      if @political_party.save
        format.html { redirect_to political_party_url(@political_party), notice: "Political party was successfully created." }
        format.json { render :show, status: :created, location: @political_party }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @political_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /political_parties/1 or /political_parties/1.json
  def update
    respond_to do |format|
      if @political_party.update(political_party_params)
        format.html { redirect_to political_party_url(@political_party), notice: "Political party was successfully updated." }
        format.json { render :show, status: :ok, location: @political_party }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @political_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /political_parties/1 or /political_parties/1.json
  def destroy
    @political_party.destroy

    respond_to do |format|
      format.html { redirect_to political_parties_url, notice: "Political party was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_political_party
      @political_party = PoliticalParty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def political_party_params
      params.require(:political_party).permit(:name, :iebc_id, :admin_id)
    end
end
