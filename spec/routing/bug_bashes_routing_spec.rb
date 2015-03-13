require "rails_helper"

RSpec.describe BugBashesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bug_bashes").to route_to("bug_bashes#index")
    end

    it "routes to #new" do
      expect(:get => "/bug_bashes/new").to route_to("bug_bashes#new")
    end

    it "routes to #show" do
      expect(:get => "/bug_bashes/1").to route_to("bug_bashes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bug_bashes/1/edit").to route_to("bug_bashes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bug_bashes").to route_to("bug_bashes#create")
    end

    it "routes to #update" do
      expect(:put => "/bug_bashes/1").to route_to("bug_bashes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bug_bashes/1").to route_to("bug_bashes#destroy", :id => "1")
    end

  end
end
