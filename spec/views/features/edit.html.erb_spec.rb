require 'rails_helper'

RSpec.describe "features/edit", type: :view do
  before(:each) do
    @feature = assign(:feature, Feature.create!(
      :name => "MyString",
      :description_markdown => "MyText",
      :description_html => "MyText",
      :test_suite => nil
    ))
  end

  it "renders the edit feature form" do
    render

    assert_select "form[action=?][method=?]", feature_path(@feature), "post" do

      assert_select "input#feature_name[name=?]", "feature[name]"

      assert_select "textarea#feature_description_markdown[name=?]", "feature[description_markdown]"

      assert_select "textarea#feature_description_html[name=?]", "feature[description_html]"

      assert_select "input#feature_test_suite_id[name=?]", "feature[test_suite_id]"
    end
  end
end
