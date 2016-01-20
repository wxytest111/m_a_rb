class ApplyShopsController < ApplicationController
  before_action :set_apply_shop, only: [:show, :edit, :update, :destroy]

  # GET /apply_shops
  # GET /apply_shops.json
  def index
    @apply_shops = ApplyShop.all
  end

  # GET /apply_shops/1
  # GET /apply_shops/1.json
  def show
  end

  # GET /apply_shops/new
  def new
    @apply_shop = ApplyShop.new
  end

  # GET /apply_shops/1/edit
  def edit
  end

  # POST /apply_shops
  # POST /apply_shops.json
  def create
    @apply_shop = ApplyShop.new(apply_shop_params)

    respond_to do |format|
      if @apply_shop.save
        format.html { redirect_to @apply_shop, notice: 'Apply shop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apply_shop }
      else
        format.html { render action: 'new' }
        format.json { render json: @apply_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apply_shops/1
  # PATCH/PUT /apply_shops/1.json
  def update
    respond_to do |format|
      if @apply_shop.update(apply_shop_params)
        format.html { redirect_to @apply_shop, notice: 'Apply shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apply_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_shops/1
  # DELETE /apply_shops/1.json
  def destroy
    @apply_shop.destroy
    respond_to do |format|
      format.html { redirect_to apply_shops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_shop
      @apply_shop = ApplyShop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_shop_params
      params.require(:apply_shop).permit(:name, :sex, :tel, :email, :creid, :company, :shop_id, :state)
    end
end
