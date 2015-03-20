class Tester < ActiveRecord::Base
  belongs_to :user
  belongs_to :test_suite
  validates_presence_of :user, :test_suite

  has_many :approvals, dependent: :destroy
  has_many :features, through: :approvals
end
