class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy]
  before_action :set_surplus, except: :org_index

  def index
    @claims = @surplus.claims.all
  end

  def org_index
    @claims = Claim.includes(:surplu).where organization_id: params[:organization_id]
  end

  def show
  end

  def new
    @claim = @surplus.claims.new
  end

  def edit
  end

  def create
    @claim = @surplus.claims.new(claim_params)

    respond_to do |format|
      if @claim.save
        format.html { redirect_to [@surplus, @claim], notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: [@surplus, @claim] }
      else
        format.html { render :new }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to [@surplus, @claim], notice: 'Claim was successfully updated.' }
        format.json { render :show, status: :ok, location: [@surplus, @claim] }
      else
        format.html { render :edit }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to surplu_claims_url, notice: 'Claim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    def set_surplus
      @surplus = Surplu.find(params[:surplu_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params.require(:claim).permit(:quantity, :picked_up, :active, :surplu_id, :organization_id)
    end
end
