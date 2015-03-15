require 'rails_helper'

RSpec.describe "Features", type: :request do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end
  before(:all) do
    @test_suite = TestSuite.create(name: 'test')
  end
  describe "GET /features" do
    it "works! (now write some real specs)" do
      get test_suite_features_path(@test_suite)
      expect(response).to have_http_status(200)
    end
  end
end
