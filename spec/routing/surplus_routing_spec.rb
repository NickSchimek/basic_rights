require "rails_helper"

RSpec.describe SurplusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "organizations/1/surplus").to route_to("surplus#index", organization_id: '1')
    end

    it "routes to #new" do
      expect(:get => "organizations/1/surplus/new").to route_to("surplus#new", organization_id: '1')
    end

    it "routes to #show" do
      expect(:get => "organizations/1/surplus/1").to route_to("surplus#show", id: '1', organization_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "organizations/1/surplus/1/edit").to route_to("surplus#edit", id: '1', organization_id: '1')
    end


    it "routes to #create" do
      expect(:post => "organizations/1/surplus").to route_to("surplus#create", organization_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "organizations/1/surplus/1").to route_to("surplus#update", id: '1', organization_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "organizations/1/surplus/1").to route_to("surplus#update", id: '1', organization_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "organizations/1/surplus/1").to route_to("surplus#destroy", id: '1', organization_id: '1')
    end
  end
end
