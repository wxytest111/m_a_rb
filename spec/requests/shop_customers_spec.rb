require 'rails_helper'

RSpec.describe "ShopCustomers", type: :request do
  describe "GET /shop_customers" do
    it "works! (now write some real specs)" do
      get shop_customers_path
      expect(response).to have_http_status(200)
    end
  end
end
