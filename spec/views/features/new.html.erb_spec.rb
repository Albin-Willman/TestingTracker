require 'rails_helper'

RSpec.describe "features/new", type: :view do
  before(:each) do
    assign(:feature, Feature.new(
      :name => "MyString",
      :description_markdown => "MyText",
      :description_html => "MyText",
      :test_suite => nil
    ))
  end

  it "renders new feature form" do
    render

    assert_select "form[action=?][method=?]", features_path, "post" do

      assert_select "input#feature_name[name=?]", "feature[name]"

      assert_select "textarea#feature_description_markdown[name=?]", "feature[description_markdown]"

      assert_select "textarea#feature_description_html[name=?]", "feature[description_html]"

      assert_select "input#feature_test_suite_id[name=?]", "feature[test_suite_id]"
    end
  end
end
