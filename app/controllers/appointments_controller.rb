class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def make
    @appointment = Appointment.new make_params
    @appointments = []
    if @appointment.save!
      @appointments << @appointment
      @result = 1
    else
      @result = 0
      @error_code = 10006
      @error_msg = '发起预约失败.'
    end
  end

  def recent
    mobile = params[:mobile]
    token = params[:token]
    page = params[:page]
    user_type = params[:user_type].to_i
    if user_type == 1
      @result = 0
      @error_code = 10002
      @error_msg = '您无权操作该用.'
    else
      worker = Worker.find_by_mobile(mobile)
      @appointments = []
      results = Appointment.where('status=0 or status=1')
      results.each do |result|
        unless result.workers.include? worker
          @appointments << result
        end
      end
      @result = 1
    end
  end

  def list
    mobile = params[:mobile]
    token = params[:token]
    page = params[:page]
    user_type = params[:user_type].to_i
    if user_type == 1
      customer = Customer.find_by_mobile(mobile)
      @appointments = customer.appointments.order('status asc')
    else
      worker = Worker.find_by_mobile(mobile)
      @appointments = worker.appointments.order('status asc')
    end
    @result = 1
  end

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:status, :date, :start_time, :end_time, :address, :product_id, :service_id, :customer_id)
    end

    def make_params
      params.permit(:status, :date, :start_time, :end_time, :address, :product_id, :service_id, :customer_id)
    end
end
