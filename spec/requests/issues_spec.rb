require 'rails_helper'

RSpec.describe "Issues", type: :request do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end
  
  describe "GET /issues" do
    it "works! (now write some real specs)" do
      get issues_path
      expect(response).to have_http_status(200)
    end
  end
end
