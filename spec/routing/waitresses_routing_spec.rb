require "rails_helper"

RSpec.describe WaitressesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/waitresses").to route_to("waitresses#index")
    end

    it "routes to #new" do
      expect(:get => "/waitresses/new").to route_to("waitresses#new")
    end

    it "routes to #show" do
      expect(:get => "/waitresses/1").to route_to("waitresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/waitresses/1/edit").to route_to("waitresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/waitresses").to route_to("waitresses#create")
    end

    it "routes to #update" do
      expect(:put => "/waitresses/1").to route_to("waitresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/waitresses/1").to route_to("waitresses#destroy", :id => "1")
    end

  end
end
