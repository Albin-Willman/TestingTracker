require 'rails_helper'

RSpec.describe GithubToken, type: :model do
  
  it 'validates the length of the token' do
    t = GithubToken.new(title: 'Test', access_token: 'aasdasd')
    t.save
    expect(t.errors.any?).to be_truthy
  end

  context 'repos' do
    let (:personal_repos) {
      'personal repos'
    }
    let (:org_repos) {
      "repos for org"
    }
    before(:each) do
      allow_any_instance_of(Octokit::Client).to receive(:repos).and_return(personal_repos)
      allow_any_instance_of(Octokit::Client).to receive(:org_repos).and_return(org_repos)
    end

    it 'return repos for github user if no organization is set' do
      token = GithubToken.new(title: 'Test', access_token: 'aasdasd')
      expect(token.repos).to eq(personal_repos)
    end

    it 'return org repos if org is set' do
      token = GithubToken.new(title: 'Test', access_token: 'aasdasd', organization: 'org')
      expect(token.repos).to eq(org_repos)
    end
  end


  

end
