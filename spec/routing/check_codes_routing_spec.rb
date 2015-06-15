require "rails_helper"

RSpec.describe CheckCodesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/check_codes").to route_to("check_codes#index")
    end

    it "routes to #new" do
      expect(:get => "/check_codes/new").to route_to("check_codes#new")
    end

    it "routes to #show" do
      expect(:get => "/check_codes/1").to route_to("check_codes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/check_codes/1/edit").to route_to("check_codes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/check_codes").to route_to("check_codes#create")
    end

    it "routes to #update" do
      expect(:put => "/check_codes/1").to route_to("check_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/check_codes/1").to route_to("check_codes#destroy", :id => "1")
    end

  end
end
