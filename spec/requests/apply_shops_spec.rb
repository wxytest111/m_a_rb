require 'rails_helper'

RSpec.describe "ApplyShops", type: :request do
  describe "GET /apply_shops" do
    it "works! (now write some real specs)" do
      get apply_shops_path
      expect(response).to have_http_status(200)
    end
  end
end
