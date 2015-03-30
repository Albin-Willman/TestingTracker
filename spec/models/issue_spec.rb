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
    def issue(repo, number)
      raise "Mock error" if @error
      { state: 'closed' }
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
    allow_any_instance_of(GithubToken).to receive(:client).and_return(GithubClientMock.new(true))
    expect(@issue.register_on_github).to be_nil
    expect(@issue.number).to be_nil
  end

  it "assigns a number to the issue if the github api is working properly" do
    allow_any_instance_of(GithubToken).to receive(:client).and_return(GithubClientMock.new(false))
    @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
    @issue.github_token = GithubToken.create!(access_token: 'tokentokentokentokentokentokentokentoken', title: 'test')
    @issue.save!
    expect(@issue.number).to eq(1)
  end

  context 'build_github_markdown' do
    it 'includes tagline, user and description' do
      @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
      expect(@issue.build_github_markdown).to eq("Issue created in test tracker:<br/><br/>desc<br/><br/>By user: test@example.com")
    end

    it 'includes feature name if associated with a feature' do
      @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
      @issue.feature = Feature.new(name: 'feature_name')
      expect(@issue.build_github_markdown).to include("feature_name")
    end

    it 'includes test_suite name if associated with a test_suite' do
      @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
      @issue.test_suite = TestSuite.new(name: 'test_suite_name')
      expect(@issue.build_github_markdown).to include("test_suite_name")
    end
  end
  context 'check_github_status' do

    before(:each) do
      allow_any_instance_of(GithubToken).to receive(:client).and_return(GithubClientMock.new(false))
      @issue = Issue.new(title: 'title', description_markdown: 'desc', user_id: @user.id)
      @issue.github_token = GithubToken.create!(access_token: 'tokentokentokentokentokentokentokentoken', title: 'test')
      @issue.save!
    end

    it 'checks status in github on save' do
      expect(@issue.closed).to be_falsey
      @issue.title = 'new'
      @issue.save!
      expect(@issue.closed).to be_truthy
    end

    it 'can not update status with bad token' do
      allow_any_instance_of(GithubToken).to receive(:client).and_return(GithubClientMock.new(true))
      expect(@issue.closed).to be_falsey
      @issue.title = 'new'
      @issue.save!
      expect(@issue.closed).to be_falsey
    end
  end
end
