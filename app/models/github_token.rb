class GithubToken < ActiveRecord::Base
  validates_length_of :access_token, :minimum => 40, :maximum => 40

  def github_client
    Octokit::Client.new(access_token: access_token)
  end
end
