require 'rails_helper'

RSpec.describe "issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        :feature => nil,
        :test_suite => nil,
        :title => "Title",
        :closed => false,
        :number => 1,
        :description_markdown => "MyText",
        :description_html => "MyText",
        :user => nil
      ),
      Issue.create!(
        :feature => nil,
        :test_suite => nil,
        :title => "Title",
        :closed => false,
        :number => 1,
        :description_markdown => "MyText",
        :description_html => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
