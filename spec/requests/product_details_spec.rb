require 'rails_helper'

RSpec.describe "ProductDetails", type: :request do
  describe "GET /product_details" do
    it "works! (now write some real specs)" do
      get product_details_path
      expect(response).to have_http_status(200)
    end
  end
end
