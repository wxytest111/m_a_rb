require "rails_helper"

RSpec.describe ApplyShopsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/apply_shops").to route_to("apply_shops#index")
    end

    it "routes to #new" do
      expect(:get => "/apply_shops/new").to route_to("apply_shops#new")
    end

    it "routes to #show" do
      expect(:get => "/apply_shops/1").to route_to("apply_shops#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/apply_shops/1/edit").to route_to("apply_shops#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/apply_shops").to route_to("apply_shops#create")
    end

    it "routes to #update" do
      expect(:put => "/apply_shops/1").to route_to("apply_shops#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/apply_shops/1").to route_to("apply_shops#destroy", :id => "1")
    end

  end
end
