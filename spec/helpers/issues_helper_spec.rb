require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the IssuesHelper. For example:
#
# describe IssuesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe IssuesHelper, type: :helper do

  context 'method issues_back_path(issue)' do
    it 'returns path to index for issue with no assossiations' do
      issue = Issue.new
      expect(issues_back_path(issue)).to eq(issues_path)
    end

    it 'returns path to test suite for issue with assossiated with test suite but no feature' do
      issue = Issue.new
      test_suite = TestSuite.create!(name: 'test', description: 'desc', status: 'active')
      issue.test_suite = test_suite
      expect(issues_back_path(issue)).to eq(test_suite_path(test_suite))
    end

    it 'returns path to feature for issue with assossiated with test suite and feature' do
      issue = Issue.new
      test_suite = TestSuite.create!(name: 'test', description: 'desc', status: 'active')
      issue.test_suite = test_suite
      feature = Feature.create!(name: 'name', description_markdown: 'markdown', test_suite: test_suite)
      issue.feature = feature
      expect(issues_back_path(issue)).to eq(test_suite_feature_path(test_suite, feature))
    end
  end

  context 'method link_to_feature(feature)' do
    it 'returns nil if given nil' do
      expect(link_to_feature(nil)).to be_nil
    end

    it 'returns a link to a feature if a feature is given' do
      test_suite = TestSuite.create!(name: 'test', description: 'desc', status: 'active')
      feature = Feature.create!(name: 'name', description_markdown: 'markdown', test_suite: test_suite)
      expect(link_to_feature(feature)).to eq(link_to(feature.name, test_suite_feature_path(feature.test_suite, feature)))
    end
  end
end
