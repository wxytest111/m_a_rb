require "rails_helper"

RSpec.describe BeauticiansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/beauticians").to route_to("beauticians#index")
    end

    it "routes to #new" do
      expect(:get => "/beauticians/new").to route_to("beauticians#new")
    end

    it "routes to #show" do
      expect(:get => "/beauticians/1").to route_to("beauticians#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/beauticians/1/edit").to route_to("beauticians#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/beauticians").to route_to("beauticians#create")
    end

    it "routes to #update" do
      expect(:put => "/beauticians/1").to route_to("beauticians#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/beauticians/1").to route_to("beauticians#destroy", :id => "1")
    end

  end
end
