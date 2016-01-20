class WaitressesController < ApplicationController
  before_action :set_waitress, only: [:show, :edit, :update, :destroy]

  # GET /waitresses
  # GET /waitresses.json
  def index
    @waitresses = Waitress.all
  end

  # GET /waitresses/1
  # GET /waitresses/1.json
  def show
  end

  # GET /waitresses/new
  def new
    @waitress = Waitress.new
  end

  # GET /waitresses/1/edit
  def edit
  end

  # POST /waitresses
  # POST /waitresses.json
  def create
    @waitress = Waitress.new(waitress_params)

    respond_to do |format|
      if @waitress.save
        format.html { redirect_to @waitress, notice: 'Waitress was successfully created.' }
        format.json { render action: 'show', status: :created, location: @waitress }
      else
        format.html { render action: 'new' }
        format.json { render json: @waitress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waitresses/1
  # PATCH/PUT /waitresses/1.json
  def update
    respond_to do |format|
      if @waitress.update(waitress_params)
        format.html { redirect_to @waitress, notice: 'Waitress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @waitress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waitresses/1
  # DELETE /waitresses/1.json
  def destroy
    @waitress.destroy
    respond_to do |format|
      format.html { redirect_to waitresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitress
      @waitress = Waitress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waitress_params
      params.require(:waitress).permit(:name, :description)
    end
end
