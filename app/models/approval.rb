class Approval < ActiveRecord::Base
  belongs_to :tester
  belongs_to :feature
end
