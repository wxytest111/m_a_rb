class PayRecordsController < ApplicationController
  before_action :set_pay_record, only: [:show, :edit, :update, :destroy]

  # GET /pay_records
  # GET /pay_records.json
  def index
    @pay_records = PayRecord.all
  end

  # GET /pay_records/1
  # GET /pay_records/1.json
  def show
  end

  # GET /pay_records/new
  def new
    @pay_record = PayRecord.new
  end

  # GET /pay_records/1/edit
  def edit
  end

  # POST /pay_records
  # POST /pay_records.json
  def create
    @pay_record = PayRecord.new(pay_record_params)

    respond_to do |format|
      if @pay_record.save
        format.html { redirect_to @pay_record, notice: 'Pay record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pay_record }
      else
        format.html { render action: 'new' }
        format.json { render json: @pay_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_records/1
  # PATCH/PUT /pay_records/1.json
  def update
    respond_to do |format|
      if @pay_record.update(pay_record_params)
        format.html { redirect_to @pay_record, notice: 'Pay record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pay_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_records/1
  # DELETE /pay_records/1.json
  def destroy
    @pay_record.destroy
    respond_to do |format|
      format.html { redirect_to pay_records_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_record
      @pay_record = PayRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_record_params
      params.require(:pay_record).permit(:customer_id, :product_id, :shop_id, :pay_state, :pay_num, :pay_time, :total_count, :left_count)
    end
end
