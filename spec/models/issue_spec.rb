require 'rails_helper'

RSpec.describe Issue, type: :model do

  before(:each) do
    @user = User.create(email: 'test@example.com', password: '123456')
  end

  class GithubClientMock
    def initialize(error)
      @error = error
    end
    def create_issue(*args)
      raise "Mock error" if @error
      { number: 1 }
    end
  end
  
  it "returns nil when trying to set issue on github without token" do
    @issue = Issue.create!(title: 'title', description_markdown: 'desc', user_id: @user.id)
    expect(@issue.register_on_github).to be_nil
  end

  it "returns nil if the github client throws an error" do
    @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
    @issue.github_token = GithubToken.create!(access_token: 'tokentokentokentokentokentokentokentoken', title: 'test')
    @issue.save!
    allow_any_instance_of(GithubToken).to receive(:github_client).and_return(GithubClientMock.new(true))
    expect(@issue.register_on_github).to be_nil
    expect(@issue.number).to be_nil
  end

  it "assigns a number to the issue if the github api is working properly" do
    allow_any_instance_of(GithubToken).to receive(:github_client).and_return(GithubClientMock.new(false))
    @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
    @issue.github_token = GithubToken.create!(access_token: 'tokentokentokentokentokentokentokentoken', title: 'test')
    @issue.save!
    expect(@issue.number).to eq(1)
  end

end
