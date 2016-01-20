require "rails_helper"

RSpec.describe ShopCustomersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shop_customers").to route_to("shop_customers#index")
    end

    it "routes to #new" do
      expect(:get => "/shop_customers/new").to route_to("shop_customers#new")
    end

    it "routes to #show" do
      expect(:get => "/shop_customers/1").to route_to("shop_customers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shop_customers/1/edit").to route_to("shop_customers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shop_customers").to route_to("shop_customers#create")
    end

    it "routes to #update" do
      expect(:put => "/shop_customers/1").to route_to("shop_customers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shop_customers/1").to route_to("shop_customers#destroy", :id => "1")
    end

  end
end
