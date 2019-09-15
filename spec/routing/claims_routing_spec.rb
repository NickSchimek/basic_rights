require "rails_helper"

RSpec.describe ClaimsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "surplus/1/claims").to route_to("claims#index", surplu_id: '1')
    end

    it "routes to #new" do
      expect(:get => "surplus/1/claims/new").to route_to("claims#new", surplu_id: '1')
    end

    it "routes to #show" do
      expect(:get => "surplus/1/claims/1").to route_to("claims#show", id: '1', surplu_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "surplus/1/claims/1/edit").to route_to("claims#edit", id: '1', surplu_id: '1')
    end


    it "routes to #create" do
      expect(:post => "surplus/1/claims").to route_to("claims#create", surplu_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "surplus/1/claims/1").to route_to("claims#update", id: '1', surplu_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "surplus/1/claims/1").to route_to("claims#update", id: '1', surplu_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "surplus/1/claims/1").to route_to("claims#destroy", id: '1', surplu_id: '1')
    end
  end
end
