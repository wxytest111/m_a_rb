class WorkerStreetsController < ApplicationController
  before_action :set_worker_street, only: [:show, :edit, :update, :destroy]

  # GET /worker_streets
  # GET /worker_streets.json
  def index
    @worker_streets = WorkerStreet.all
  end

  # GET /worker_streets/1
  # GET /worker_streets/1.json
  def show
  end

  # GET /worker_streets/new
  def new
    @worker_street = WorkerStreet.new
  end

  # GET /worker_streets/1/edit
  def edit
  end

  # POST /worker_streets
  # POST /worker_streets.json
  def create
    @worker_street = WorkerStreet.new(worker_street_params)

    respond_to do |format|
      if @worker_street.save
        format.html { redirect_to @worker_street, notice: 'Worker street was successfully created.' }
        format.json { render action: 'show', status: :created, location: @worker_street }
      else
        format.html { render action: 'new' }
        format.json { render json: @worker_street.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worker_streets/1
  # PATCH/PUT /worker_streets/1.json
  def update
    respond_to do |format|
      if @worker_street.update(worker_street_params)
        format.html { redirect_to @worker_street, notice: 'Worker street was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worker_street.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worker_streets/1
  # DELETE /worker_streets/1.json
  def destroy
    @worker_street.destroy
    respond_to do |format|
      format.html { redirect_to worker_streets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker_street
      @worker_street = WorkerStreet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_street_params
      params.require(:worker_street).permit(:worker_id, :street_id)
    end
end
