class FulfillmentsController < ApplicationController
  before_action :set_fulfillment, only: [:show, :edit, :update, :destroy]
  before_action :set_need

  def index
    @fulfillments = @need.fulfillments.all.includes(:need, :organization)
  end

  def show
  end

  def new
    @fulfillment = @need.fulfillments.new
  end

  def drop_off
    @fulfillment = @need.fulfillments.new
  end

  def edit
  end

  def create
    @fulfillment = @need.fulfillments.new(fulfillment_params)

    respond_to do |format|
      if @fulfillment.save
        format.html { redirect_to [@need, @fulfillment], notice: 'Fulfillment was successfully created.' }
        format.json { render :show, status: :created, location: [@need, @fulfillment] }
      else
        format.html { render :new }
        format.json { render json: @fulfillment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fulfillment.update(fulfillment_params)
        format.html { redirect_to [@need, @fulfillment], notice: 'Fulfillment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@need, @fulfillment] }
      else
        format.html { render :edit }
        format.json { render json: @fulfillment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fulfillment.destroy
    respond_to do |format|
      format.html { redirect_to need_fulfillments_url(@fulfillment.need), notice: 'Fulfillment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fulfillment
      @fulfillment = Fulfillment.find(params[:id])
    end

    def set_need
      @need = Need.find(params[:need_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fulfillment_params
      params.require(:fulfillment).permit(:quantity, :received, :active, :need_id, :organization_id)
    end
end
