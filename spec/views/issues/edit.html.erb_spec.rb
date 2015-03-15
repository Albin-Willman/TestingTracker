require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :feature => nil,
      :test_suite => nil,
      :title => "MyString",
      :closed => false,
      :number => 1,
      :description_markdown => "MyText",
      :description_html => "MyText",
      :user => nil
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "input#issue_feature_id[name=?]", "issue[feature_id]"

      assert_select "input#issue_test_suite_id[name=?]", "issue[test_suite_id]"

      assert_select "input#issue_title[name=?]", "issue[title]"

      assert_select "input#issue_closed[name=?]", "issue[closed]"

      assert_select "input#issue_number[name=?]", "issue[number]"

      assert_select "textarea#issue_description_markdown[name=?]", "issue[description_markdown]"

      assert_select "textarea#issue_description_html[name=?]", "issue[description_html]"

      assert_select "input#issue_user_id[name=?]", "issue[user_id]"
    end
  end
end
