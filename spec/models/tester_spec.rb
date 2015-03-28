require 'rails_helper'

RSpec.describe Tester, type: :model do
  context "Validations" do
    PRESENCE_ERROR = "can't be blank"
    it 'validates the presence of a user' do
      tester = Tester.create
      expect(tester.errors.any?).to be_truthy
      expect(tester.errors.messages[:user]).to include(PRESENCE_ERROR)
    end

    it 'validates the presence of a test_suite' do
      tester = Tester.create
      expect(tester.errors.any?).to be_truthy
      expect(tester.errors.messages[:test_suite]).to include(PRESENCE_ERROR)
    end

    it 'can be created without errors' do
      user       = User.create! email: 'email@example.com', password: '123456'
      test_suite = TestSuite.create! name: 'test', status: 'active'
      tester = Tester.create user: user, test_suite: test_suite
      expect(tester.errors.any?).to be_falsey
    end
  end
end
