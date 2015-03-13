require 'rails_helper'

RSpec.describe "BugBashes", type: :request do
  describe "GET /bug_bashes" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
    end
    it "works! (now write some real specs)" do
      get bug_bashes_path
      expect(response).to have_http_status(200)
    end
  end
end
