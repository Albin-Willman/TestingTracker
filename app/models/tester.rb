class Tester < ActiveRecord::Base
  belongs_to :user
  belongs_to :test_suite

  has_many :approvals
  has_many :features, through: :approvals
end
