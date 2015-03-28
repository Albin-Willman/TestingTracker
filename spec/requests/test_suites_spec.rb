require 'rails_helper'

RSpec.describe "TestSuites", type: :request do
  before(:each) do
    @user = User.create! email: 'admin@example.com', password: '123456', admin: true
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "GET /test_suites" do
    it "works! (now write some real specs)" do
      get test_suites_path
      expect(response).to have_http_status(200)
    end
  end
end
