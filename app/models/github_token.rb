class GithubToken < ActiveRecord::Base
  validates_length_of :access_token, :minimum => 40, :maximum => 40
end
