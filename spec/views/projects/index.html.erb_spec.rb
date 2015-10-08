require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :alumni => nil,
        :name => "Name",
        :url => "Url",
        :description => "MyText"
      ),
      Project.create!(
        :alumni => nil,
        :name => "Name",
        :url => "Url",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
