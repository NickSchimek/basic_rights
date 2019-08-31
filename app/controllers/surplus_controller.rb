class SurplusController < ApplicationController
  before_action :set_surplus, only: [:show, :edit, :update, :destroy]

  # GET /surplus
  # GET /surplus.json
  def index
    @surplus = Surplu.all
  end

  # GET /surplus/1
  # GET /surplus/1.json
  def show
  end

  # GET /surplus/new
  def new
    @surplus = Surplu.new
  end

  # GET /surplus/1/edit
  def edit
  end

  # POST /surplus
  # POST /surplus.json
  def create
    @surplus = Surplu.new(surplus_params)

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

  # PATCH/PUT /surplus/1
  # PATCH/PUT /surplus/1.json
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

  # DELETE /surplus/1
  # DELETE /surplus/1.json
  def destroy
    @surplus.destroy
    respond_to do |format|
      format.html { redirect_to surplus_url, notice: 'Surplus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surplus
      @surplus = Surplu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surplus_params
      params.require(:surplu).permit(:resource, :description, :quantity, :active)
    end
end
