require 'rails_helper'

RSpec.describe Feature, type: :model do
  context "Validations" do
    it 'validates the presence of a test_suite' do
      feature = Feature.create
      expect(feature.errors.any?).to be_truthy
      expect(feature.errors.messages[:test_suite]).to include(PRESENCE_ERROR)
    end

    it 'validates the presence of a name' do
      feature = Feature.create
      expect(feature.errors.any?).to be_truthy
      expect(feature.errors.messages[:name]).to include(PRESENCE_ERROR)
    end

    it 'can be created without errors' do
      test_suite = TestSuite.create! name: 'test', status: 'active'
      feature    = Feature.create! test_suite: test_suite, name: 'feature'
      expect(feature.errors.any?).to be_falsey
    end
  end

  context "html generation" do
    it 'generates html from markdown when saved' do
      test_suite = TestSuite.create! name: 'test', status: 'active'
      feature    = Feature.create!(
        test_suite: test_suite,
        name: 'feature',
        description_markdown: "## test")
      expect(feature.description_html).to eq("<h2>test</h2>\n")
    end

  end
end
