require 'rails_helper'

RSpec.describe "WorkerStreets", type: :request do
  describe "GET /worker_streets" do
    it "works! (now write some real specs)" do
      get worker_streets_path
      expect(response).to have_http_status(200)
    end
  end
end
