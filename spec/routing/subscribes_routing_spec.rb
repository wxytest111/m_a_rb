require "rails_helper"

RSpec.describe SubscribesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subscribes").to route_to("subscribes#index")
    end

    it "routes to #new" do
      expect(:get => "/subscribes/new").to route_to("subscribes#new")
    end

    it "routes to #show" do
      expect(:get => "/subscribes/1").to route_to("subscribes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subscribes/1/edit").to route_to("subscribes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subscribes").to route_to("subscribes#create")
    end

    it "routes to #update" do
      expect(:put => "/subscribes/1").to route_to("subscribes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subscribes/1").to route_to("subscribes#destroy", :id => "1")
    end

  end
end
