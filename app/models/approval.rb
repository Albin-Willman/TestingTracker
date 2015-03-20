class Approval < ActiveRecord::Base
  belongs_to :tester
  belongs_to :feature
  validates_presence_of :tester, :feature
end
