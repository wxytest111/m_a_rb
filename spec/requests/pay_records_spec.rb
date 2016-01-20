require 'rails_helper'

RSpec.describe "PayRecords", type: :request do
  describe "GET /pay_records" do
    it "works! (now write some real specs)" do
      get pay_records_path
      expect(response).to have_http_status(200)
    end
  end
end
