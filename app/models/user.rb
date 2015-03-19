class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end
  has_many :testers
  has_many :test_suites, through: :testers
  has_many :approvals, through: :testers
  has_many :features, through: :approvals

  def can_approve?(feature)
    test_suites.include?(feature.test_suite)
  end

  def last_approved(feature)
    feature_approvals = approvals.where(feature_id: feature.id)
    feature_approvals.any? && feature_approvals.last.created_at
  end

end

