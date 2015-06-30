require "rails_helper"

RSpec.describe WorkerStreetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/worker_streets").to route_to("worker_streets#index")
    end

    it "routes to #new" do
      expect(:get => "/worker_streets/new").to route_to("worker_streets#new")
    end

    it "routes to #show" do
      expect(:get => "/worker_streets/1").to route_to("worker_streets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/worker_streets/1/edit").to route_to("worker_streets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/worker_streets").to route_to("worker_streets#create")
    end

    it "routes to #update" do
      expect(:put => "/worker_streets/1").to route_to("worker_streets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/worker_streets/1").to route_to("worker_streets#destroy", :id => "1")
    end

  end
end
