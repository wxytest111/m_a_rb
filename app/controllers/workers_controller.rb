class WorkersController < ApplicationController
  before_filter :set_headers
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def list
    mobile = params[:mobile]
    token = params[:token]
    page = params[:page]
    user_type = params[:user_type]
    @result = 1
    @workers = Worker.all
  end
  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
    @result = 1
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        set_strees params[:choose_streets], @worker
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @worker }
      else
        format.html { render action: 'new' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        set_strees params[:choose_streets], @worker

        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:name, :mobile, :avatar, :pic, :address, :password, :star, :gender, :description, :skills, :success, :cancel, :miss)
    end

    def set_strees choose_streets, worker
      worker.streets = []
      streets = []
      choose_streets.split(',').each do |street|
        streets << Street.find(street)
      end
      worker.streets = streets

    end
end
