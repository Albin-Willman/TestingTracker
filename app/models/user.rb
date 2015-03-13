class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end
  has_many :testers
  has_many :bug_bashes, through: :testers
end

