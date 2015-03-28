require 'rails_helper'

RSpec.describe Approval, type: :model do
  context "Validations" do
    it 'validates the presence of a feature' do
      approval = Approval.create
      expect(approval.errors.any?).to be_truthy
      expect(approval.errors.messages[:feature]).to include(PRESENCE_ERROR)
    end

    it 'validates the presence of a tester' do
      approval = Approval.create
      expect(approval.errors.any?).to be_truthy
      expect(approval.errors.messages[:tester]).to include(PRESENCE_ERROR)
    end

    it 'can be created without errors' do
      user       = User.create! email: 'email@example.com', password: '123456'
      test_suite = TestSuite.create! name: 'test', status: 'active'
      tester     = Tester.create! user: user, test_suite: test_suite
      feature    = Feature.create! test_suite: test_suite, name: 'feature'
      approval   = Approval.create tester: tester, feature: feature
      expect(approval.errors.any?).to be_falsey
    end
  end
end
