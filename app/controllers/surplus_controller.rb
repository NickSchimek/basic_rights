class SurplusController < ApplicationController
  before_action :set_surplus, only: [:show, :edit, :update, :destroy]
  before_action :set_organization, only: [:index, :create, :new]

  def index
    @surplus = @organization.surplus.all
  end

  def grouped_index
    active = params.fetch(:active, true)
    @organizations = Organization.all.includes(:surplus).
                                      where('surplus.active = ?', active).
                                      references(:surplus)
  end

  def show
  end

  def new
    @surplus = @organization.surplus.new
  end

  def edit
  end

  def create
    @surplus = @organization.surplus.new(surplus_params)

    respond_to do |format|
      if @surplus.save
        format.html { redirect_to @surplus, notice: 'Surplus was successfully created.' }
        format.json { render :show, status: :created, location: @surplus }
      else
        format.html { render :new }
        format.json { render json: @surplus.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @surplus.update(surplus_params)
        format.html { redirect_to @surplus, notice: 'Surplus was successfully updated.' }
        format.json { render :show, status: :ok, location: @surplus }
      else
        format.html { render :edit }
        format.json { render json: @surplus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @surplus.destroy
    respond_to do |format|
      format.html { redirect_to organization_surplus_url(@surplus.organization), notice: 'Surplus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surplus
      @surplus = Surplu.includes(:organization).find(params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surplus_params
      params.require(:surplu).permit(:resource, :description, :quantity, :active)
    end
end
