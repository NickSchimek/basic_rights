class SurplusesController < ApplicationController
  before_action :set_surpluse, only: [:show, :edit, :update, :destroy]

  # GET /surpluses
  # GET /surpluses.json
  def index
    @surpluses = Surpluse.all
  end

  # GET /surpluses/1
  # GET /surpluses/1.json
  def show
  end

  # GET /surpluses/new
  def new
    @surpluse = Surpluse.new
  end

  # GET /surpluses/1/edit
  def edit
  end

  # POST /surpluses
  # POST /surpluses.json
  def create
    @surpluse = Surpluse.new(surpluse_params)

    respond_to do |format|
      if @surpluse.save
        format.html { redirect_to @surpluse, notice: 'Surpluse was successfully created.' }
        format.json { render :show, status: :created, location: @surpluse }
      else
        format.html { render :new }
        format.json { render json: @surpluse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surpluses/1
  # PATCH/PUT /surpluses/1.json
  def update
    respond_to do |format|
      if @surpluse.update(surpluse_params)
        format.html { redirect_to @surpluse, notice: 'Surpluse was successfully updated.' }
        format.json { render :show, status: :ok, location: @surpluse }
      else
        format.html { render :edit }
        format.json { render json: @surpluse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surpluses/1
  # DELETE /surpluses/1.json
  def destroy
    @surpluse.destroy
    respond_to do |format|
      format.html { redirect_to surpluses_url, notice: 'Surpluse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surpluse
      @surpluse = Surpluse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surpluse_params
      params.require(:surpluse).permit(:resource, :description, :quantity, :active)
    end
end
