class CheckCodesController < ApplicationController
  before_action :set_check_code, only: [:show, :edit, :update, :destroy]

  # GET /check_codes
  # GET /check_codes.json
  def index
    @check_codes = CheckCode.all
  end

  # GET /check_codes/1
  # GET /check_codes/1.json
  def show
  end

  # GET /check_codes/new
  def new
    @check_code = CheckCode.new
  end

  # GET /check_codes/1/edit
  def edit
  end

  # POST /check_codes
  # POST /check_codes.json
  def create
    @check_code = CheckCode.new(check_code_params)

    respond_to do |format|
      if @check_code.save
        format.html { redirect_to @check_code, notice: 'Check code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @check_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @check_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_codes/1
  # PATCH/PUT /check_codes/1.json
  def update
    respond_to do |format|
      if @check_code.update(check_code_params)
        format.html { redirect_to @check_code, notice: 'Check code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_codes/1
  # DELETE /check_codes/1.json
  def destroy
    @check_code.destroy
    respond_to do |format|
      format.html { redirect_to check_codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_code
      @check_code = CheckCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_code_params
      params.require(:check_code).permit(:code, :mobile)
    end
end
