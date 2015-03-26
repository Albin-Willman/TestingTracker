class GithubToken < ActiveRecord::Base
  validates_length_of :access_token, :minimum => 40, :maximum => 40

  def client
    Octokit::Client.new(access_token: access_token)
  end

  def repos
    return client.repos unless organization
    client.org_repos(organization)
  rescue
    []
  end
end
