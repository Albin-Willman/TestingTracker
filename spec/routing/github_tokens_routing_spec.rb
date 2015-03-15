require "rails_helper"

RSpec.describe GithubTokensController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/github_tokens").to route_to("github_tokens#index")
    end

    it "routes to #new" do
      expect(:get => "/github_tokens/new").to route_to("github_tokens#new")
    end

    it "routes to #show" do
      expect(:get => "/github_tokens/1").to route_to("github_tokens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/github_tokens/1/edit").to route_to("github_tokens#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/github_tokens").to route_to("github_tokens#create")
    end

    it "routes to #update" do
      expect(:put => "/github_tokens/1").to route_to("github_tokens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/github_tokens/1").to route_to("github_tokens#destroy", :id => "1")
    end

  end
end
