require "rails_helper"

RSpec.describe GrabsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grabs").to route_to("grabs#index")
    end

    it "routes to #new" do
      expect(:get => "/grabs/new").to route_to("grabs#new")
    end

    it "routes to #show" do
      expect(:get => "/grabs/1").to route_to("grabs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/grabs/1/edit").to route_to("grabs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grabs").to route_to("grabs#create")
    end

    it "routes to #update" do
      expect(:put => "/grabs/1").to route_to("grabs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grabs/1").to route_to("grabs#destroy", :id => "1")
    end

  end
end
