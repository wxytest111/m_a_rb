require 'rails_helper'

RSpec.describe "Waitresses", type: :request do
  describe "GET /waitresses" do
    it "works! (now write some real specs)" do
      get waitresses_path
      expect(response).to have_http_status(200)
    end
  end
end
