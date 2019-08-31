class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    @needs = @organization.needs.all
  end

  def show
  end

  def new
    @need = @organization.needs.new
  end

  def edit
  end

  def create
    @need = @organization.needs.new(need_params)

    respond_to do |format|
      if @need.save
        format.html { redirect_to [@organization, @need], notice: 'Need was successfully created.' }
        format.json { render :show, status: :created, location: [@organization, @need] }
      else
        format.html { render :new }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @need.update(need_params)
        format.html { redirect_to [@organization, @need], notice: 'Need was successfully updated.' }
        format.json { render :show, status: :ok, location: [@organization, @need] }
      else
        format.html { render :edit }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @need.destroy
    respond_to do |format|
      format.html { redirect_to organization_needs_url, notice: 'Need was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need
      @need = Need.find(params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def need_params
      params.require(:need).permit(:resource, :description, :quantity, :active)
    end
end
