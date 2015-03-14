require 'rails_helper'

RSpec.describe "features/index", type: :view do
  before(:each) do
    assign(:features, [
      Feature.create!(
        :name => "Name",
        :description_markdown => "MyText",
        :description_html => "MyText",
        :test_suite => nil
      ),
      Feature.create!(
        :name => "Name",
        :description_markdown => "MyText",
        :description_html => "MyText",
        :test_suite => nil
      )
    ])
  end

  it "renders a list of features" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
