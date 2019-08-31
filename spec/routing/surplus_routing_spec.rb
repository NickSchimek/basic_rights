require "rails_helper"

RSpec.describe SurplusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/surplus").to route_to("surplus#index")
    end

    it "routes to #new" do
      expect(:get => "/surplus/new").to route_to("surplus#new")
    end

    it "routes to #show" do
      expect(:get => "/surplus/1").to route_to("surplus#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/surplus/1/edit").to route_to("surplus#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/surplus").to route_to("surplus#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/surplus/1").to route_to("surplus#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/surplus/1").to route_to("surplus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/surplus/1").to route_to("surplus#destroy", :id => "1")
    end
  end
end
