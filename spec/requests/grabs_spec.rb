require 'rails_helper'

RSpec.describe "Grabs", type: :request do
  describe "GET /grabs" do
    it "works! (now write some real specs)" do
      get grabs_path
      expect(response).to have_http_status(200)
    end
  end
end
