require "rails_helper"

RSpec.describe ProductDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/product_details").to route_to("product_details#index")
    end

    it "routes to #new" do
      expect(:get => "/product_details/new").to route_to("product_details#new")
    end

    it "routes to #show" do
      expect(:get => "/product_details/1").to route_to("product_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_details/1/edit").to route_to("product_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/product_details").to route_to("product_details#create")
    end

    it "routes to #update" do
      expect(:put => "/product_details/1").to route_to("product_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_details/1").to route_to("product_details#destroy", :id => "1")
    end

  end
end
