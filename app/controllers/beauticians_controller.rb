class BeauticiansController < ApplicationController
  before_action :set_beautician, only: [:show, :edit, :update, :destroy]

  # GET /beauticians
  # GET /beauticians.json
  def index
    @beauticians = Beautician.all
  end

  # GET /beauticians/1
  # GET /beauticians/1.json
  def show
  end

  # GET /beauticians/new
  def new
    @beautician = Beautician.new
  end

  # GET /beauticians/1/edit
  def edit
  end

  # POST /beauticians
  # POST /beauticians.json
  def create
    @beautician = Beautician.new(beautician_params)

    respond_to do |format|
      if @beautician.save
        format.html { redirect_to @beautician, notice: 'Beautician was successfully created.' }
        format.json { render action: 'show', status: :created, location: @beautician }
      else
        format.html { render action: 'new' }
        format.json { render json: @beautician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beauticians/1
  # PATCH/PUT /beauticians/1.json
  def update
    respond_to do |format|
      if @beautician.update(beautician_params)
        format.html { redirect_to @beautician, notice: 'Beautician was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @beautician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beauticians/1
  # DELETE /beauticians/1.json
  def destroy
    @beautician.destroy
    respond_to do |format|
      format.html { redirect_to beauticians_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beautician
      @beautician = Beautician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beautician_params
      params.require(:beautician).permit(:name, :mobile, :id_card)
    end
end
