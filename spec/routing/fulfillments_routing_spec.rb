require "rails_helper"

RSpec.describe FulfillmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/fulfillments").to route_to("fulfillments#index")
    end

    it "routes to #new" do
      expect(:get => "/fulfillments/new").to route_to("fulfillments#new")
    end

    it "routes to #show" do
      expect(:get => "/fulfillments/1").to route_to("fulfillments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fulfillments/1/edit").to route_to("fulfillments#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/fulfillments").to route_to("fulfillments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fulfillments/1").to route_to("fulfillments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fulfillments/1").to route_to("fulfillments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fulfillments/1").to route_to("fulfillments#destroy", :id => "1")
    end
  end
end
