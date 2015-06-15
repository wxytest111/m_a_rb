require 'rails_helper'

RSpec.describe "CheckCodes", type: :request do
  describe "GET /check_codes" do
    it "works! (now write some real specs)" do
      get check_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
