require 'rails_helper'

RSpec.describe TestSuite, type: :model do
  context "Validations" do
    it 'validates the presence of a name' do
      test_suite = TestSuite.create
      expect(test_suite.errors.any?).to be_truthy
      expect(test_suite.errors.messages[:name]).to include(PRESENCE_ERROR)
    end

    it 'validates the presence of a status' do
      test_suite = TestSuite.create
      expect(test_suite.errors.any?).to be_truthy
      expect(test_suite.errors.messages[:status]).to include(PRESENCE_ERROR)
    end

    it 'can be created without errors' do
      test_suite = TestSuite.create name: 'Name', status: 'active'
      expect(test_suite.errors.any?).to be_falsey
    end
  end
end
