require 'rails_helper'

RSpec.describe "GithubTokens", type: :request do
  before(:each) do
    @user = User.new email: 'admin@example.com', password: '123456', admin: true
    @user.save!
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "GET /github_tokens" do
    it "works! (now write some real specs)" do
      get github_tokens_path
      expect(response).to have_http_status(200)
    end
  end
end
