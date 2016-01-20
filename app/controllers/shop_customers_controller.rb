class ShopCustomersController < ApplicationController
  before_action :set_shop_customer, only: [:show, :edit, :update, :destroy]

  # GET /shop_customers
  # GET /shop_customers.json
  def index
    @shop_customers = ShopCustomer.all
  end

  # GET /shop_customers/1
  # GET /shop_customers/1.json
  def show
  end

  # GET /shop_customers/new
  def new
    @shop_customer = ShopCustomer.new
  end

  # GET /shop_customers/1/edit
  def edit
  end

  # POST /shop_customers
  # POST /shop_customers.json
  def create
    @shop_customer = ShopCustomer.new(shop_customer_params)

    respond_to do |format|
      if @shop_customer.save
        format.html { redirect_to @shop_customer, notice: 'Shop customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shop_customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @shop_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_customers/1
  # PATCH/PUT /shop_customers/1.json
  def update
    respond_to do |format|
      if @shop_customer.update(shop_customer_params)
        format.html { redirect_to @shop_customer, notice: 'Shop customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shop_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_customers/1
  # DELETE /shop_customers/1.json
  def destroy
    @shop_customer.destroy
    respond_to do |format|
      format.html { redirect_to shop_customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_customer
      @shop_customer = ShopCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_customer_params
      params.require(:shop_customer).permit(:state, :shop_id, :customer_id)
    end
end
