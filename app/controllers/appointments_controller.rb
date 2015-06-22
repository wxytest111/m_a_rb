class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def detail
    mobile = params[:mobile]
    token = params[:token]
    id = params[:id]
    user_type = params[:user_type].to_i
    appointment = Appointment.find(id)
    if user_type == 1
      customer = Customer.find_by_mobile(mobile)
      if appointment.customer_id == customer.id
        @appointments = [appointment]
        @result = 1
      else
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.'
      end
    else
      worker = Worker.find_by_mobile(mobile)
      if appointment.workers.include? worker
        @appointments = [appointment]
        @result = 1
      else
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.'
      end
    end
  end

  def finished
    mobile = params[:mobile]
    token = params[:token]
    id = params[:id]
    user_type = params[:user_type].to_i
    appointment = Appointment.find(id)
    if user_type == 1
      customer = Customer.find_by_mobile(mobile)
      if appointment.customer_id == customer.id && !(['cancel'].include? appointment.status)
        if appointment.workers.size > 0
          appointment.status = 'finished'
          appointment.save!
          appointment.grabs.each do |grab|
            if grab.status == 'begin'
              grab.status = 'finished'
              grab.save!
            end
          end
          @result = 1
        else
          @result = 0
          @error_code = 10007
          @error_msg = '美容师未响应您的预约.'
        end
      else
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.'
      end
    else
      worker = Worker.find_by_mobile(mobile)
      if ['cancel','other_worker'].include? appointment.status
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.请和顾客联系.'
      else
        if appointment.workers.include? worker
          grab = worker.grabs.find_by_appointment_id(id)
          grab.status = 'finished'
          grab.save!
          @result = 1
        else
          @result = 0
          @error_code = 10002
          @error_msg = '您无权操作该用.'
        end
      end
    end
  end

  def begin
    mobile = params[:mobile]
    token = params[:token]
    id = params[:id]
    user_type = params[:user_type].to_i
    appointment = Appointment.find(id)
    if user_type == 1
      customer = Customer.find_by_mobile(mobile)
      if appointment.customer_id == customer.id && !(['finished','cancel'].include? appointment.status)
        if appointment.workers.size > 0
          appointment.status = 'begin'
          appointment.save!
          appointment.grabs.each do |grab|
            if grab.status == 'ready'
              grab.status = 'begin'
              grab.save!
            end
          end
          @result = 1
        else
          @result = 0
          @error_code = 10007
          @error_msg = '美容师未响应您的预约.'
        end
      else
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.'
      end
    else
      worker = Worker.find_by_mobile(mobile)
      if ['finished','cancel','other_worker'].include? appointment.status
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.请和顾客联系.'
      else
        if appointment.workers.include? worker
          grab = worker.grabs.find_by_appointment_id(id)
          grab.status = 'begin'
          grab.save!
          @result = 1
        else
          @result = 0
          @error_code = 10002
          @error_msg = '您无权操作该用.'
        end
      end
    end
  end

  def confirm
    mobile = params[:mobile]
    token = params[:token]
    id = params[:id]
    user_type = params[:user_type].to_i
    appointment = Appointment.find(id)
    if user_type == 1
      worker = Worker.find(params[:worker_id])
      customer = Customer.find_by_mobile(mobile)
      if appointment.customer_id == customer.id && !(['finished','begin','cancel'].include? appointment.status)
        if appointment.workers.include? worker
          appointment.status = 'ready'
          appointment.save!
          appointment.grabs.each do |grab|
            if grab.worker.id == worker.id
              grab.status = 'ready'
            else
              grab.status = 'other_worker'
            end
              grab.save!
          end
          @result = 1
          @appointments =[appointment]
        else
          @result = 0
          @error_code = 10007
          @error_msg = '该美容师未响应您的预约.'
        end
      else
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.'
      end
    else
      worker = Worker.find_by_mobile(mobile)
      if ['ready','finished','begin','cancel','other_worker'].include? appointment.status
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.请和顾客联系.'
      else
        if appointment.workers.include? worker
          appointment.status = 'waiting'
          appointment.save!
          grab = worker.grabs.find_by_appointment_id(id)
          grab.status = 'waiting'
          grab.save!
          @result = 1
        else
          grab = appointment.grabs.new
          appointment.status = 'waiting'
          appointment.save!
          grab.worker = worker
          grab.status = 'waiting'
          grab.save!
          @result = 1
        end
        @appointments =[appointment]
      end
    end
  end

  def cancel
    mobile = params[:mobile]
    token = params[:token]
    id = params[:id]
    user_type = params[:user_type].to_i
    appointment = Appointment.find(id)
    if user_type == 1
      customer = Customer.find_by_mobile(mobile)
      if appointment.customer_id == customer.id && !(['finished','begin'].include? appointment.status)
        appointment.status = 'cancel'
        appointment.save!
        @result = 1
      else
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.'
      end
    else
      worker = Worker.find_by_mobile(mobile)
      if ['ready','finished','begin','cancel','other_worker'].include? appointment.status
        @result = 0
        @error_code = 10002
        @error_msg = '您无权操作该用.请和顾客联系.'
      else
        if appointment.workers.include? worker
          grab = worker.grabs.find_by_appointment_id(id)
          grab.status = 'cancel'
          grab.save!
          @result = 1
        else
          @result = 0
          @error_code = 10002
          @error_msg = '您无权操作该用.'
        end
      end
    end
  end

  def make
    customer = Customer.find_by_mobile(params[:mobile])
    @appointment = Appointment.new make_params.merge({customer_id: customer.id})
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
      # @appointments = []
      @appointments = Appointment.where('status=0 or status=1')
      # results.each do |result|
      #   unless result.workers.include? worker
      #     @appointments << result
      #   end
      # end
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
      params.permit(:status, :date, :start_time, :end_time, :address, :product_id, :service_id)
    end
end
