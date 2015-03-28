class TestSuite < ActiveRecord::Base
  validates_presence_of :name, :status
  has_many :testers, dependent: :destroy
  has_many :users, through: :testers
  has_many :features, dependent: :destroy
  has_many :issues, dependent: :destroy
  belongs_to :github_token
  enum status: [:in_build, :active, :archieved]
end
