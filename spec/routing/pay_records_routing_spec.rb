require "rails_helper"

RSpec.describe PayRecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pay_records").to route_to("pay_records#index")
    end

    it "routes to #new" do
      expect(:get => "/pay_records/new").to route_to("pay_records#new")
    end

    it "routes to #show" do
      expect(:get => "/pay_records/1").to route_to("pay_records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pay_records/1/edit").to route_to("pay_records#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pay_records").to route_to("pay_records#create")
    end

    it "routes to #update" do
      expect(:put => "/pay_records/1").to route_to("pay_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pay_records/1").to route_to("pay_records#destroy", :id => "1")
    end

  end
end
