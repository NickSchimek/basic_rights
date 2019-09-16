require "rails_helper"

RSpec.describe FulfillmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "needs/1/fulfillments").to route_to("fulfillments#index", need_id: '1')
    end

    it "routes to #new" do
      expect(:get => "needs/1/fulfillments/new").to route_to("fulfillments#new", need_id: '1')
    end

    it "routes to #show" do
      expect(:get => "needs/1/fulfillments/1").to route_to("fulfillments#show", id: '1', need_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "needs/1/fulfillments/1/edit").to route_to("fulfillments#edit", id: '1', need_id: '1')
    end


    it "routes to #create" do
      expect(:post => "needs/1/fulfillments").to route_to("fulfillments#create", need_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "needs/1/fulfillments/1").to route_to("fulfillments#update", id: '1', need_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "needs/1/fulfillments/1").to route_to("fulfillments#update", id: '1', need_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "needs/1/fulfillments/1").to route_to("fulfillments#destroy", id: '1', need_id: '1')
    end
  end
end
