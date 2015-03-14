class TestSuite < ActiveRecord::Base
  validates_presence_of :name
  has_many :testers
  has_many :users, through: :testers
end
