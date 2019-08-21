require "rails_helper"

RSpec.describe SurplusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/surpluses").to route_to("surpluses#index")
    end

    it "routes to #new" do
      expect(:get => "/surpluses/new").to route_to("surpluses#new")
    end

    it "routes to #show" do
      expect(:get => "/surpluses/1").to route_to("surpluses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/surpluses/1/edit").to route_to("surpluses#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/surpluses").to route_to("surpluses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/surpluses/1").to route_to("surpluses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/surpluses/1").to route_to("surpluses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/surpluses/1").to route_to("surpluses#destroy", :id => "1")
    end
  end
end
