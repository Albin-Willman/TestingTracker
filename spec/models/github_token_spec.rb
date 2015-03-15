require 'rails_helper'

RSpec.describe GithubToken, type: :model do
  
  it 'validates the length of the token' do
    t = GithubToken.new(title: 'Test', access_token: 'aasdasd')
    t.save
    expect(t.errors.any?).to be_truthy
  end

end
