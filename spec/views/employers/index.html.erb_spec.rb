require 'rails_helper'

RSpec.describe "employers/index", type: :view do
  before(:each) do
    assign(:employers, [
      Employer.create!(
        :location => nil,
        :user => nil,
        :company_name => "Company Name",
        :website => "Website",
        :company_type => "Company Type",
        :description => "MyText"
      ),
      Employer.create!(
        :location => nil,
        :user => nil,
        :company_name => "Company Name",
        :website => "Website",
        :company_type => "Company Type",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of employers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Company Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
