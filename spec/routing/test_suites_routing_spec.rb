require "rails_helper"

RSpec.describe TestSuitesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/test_suites").to route_to("test_suites#index")
    end

    it "routes to #new" do
      expect(:get => "/test_suites/new").to route_to("test_suites#new")
    end

    it "routes to #show" do
      expect(:get => "/test_suites/1").to route_to("test_suites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_suites/1/edit").to route_to("test_suites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/test_suites").to route_to("test_suites#create")
    end

    it "routes to #update" do
      expect(:put => "/test_suites/1").to route_to("test_suites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_suites/1").to route_to("test_suites#destroy", :id => "1")
    end

  end
end
