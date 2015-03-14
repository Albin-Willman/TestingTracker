require "rails_helper"

RSpec.describe FeaturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "test_suites/1/features").to route_to("features#index", test_suite_id: "1")
    end

    it "routes to #new" do
      expect(:get => "test_suites/1/features/new").to route_to("features#new", test_suite_id: "1")
    end

    it "routes to #show" do
      expect(:get => "test_suites/1/features/1").to route_to("features#show", :id => "1", test_suite_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "test_suites/1/features/1/edit").to route_to("features#edit", :id => "1", test_suite_id: "1")
    end

    it "routes to #create" do
      expect(:post => "test_suites/1/features").to route_to("features#create", test_suite_id: "1")
    end

    it "routes to #update" do
      expect(:put => "test_suites/1/features/1").to route_to("features#update", :id => "1", test_suite_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "test_suites/1/features/1").to route_to("features#destroy", :id => "1", test_suite_id: "1")
    end

  end
end
