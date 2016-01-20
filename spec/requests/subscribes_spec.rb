require 'rails_helper'

RSpec.describe "Subscribes", type: :request do
  describe "GET /subscribes" do
    it "works! (now write some real specs)" do
      get subscribes_path
      expect(response).to have_http_status(200)
    end
  end
end
