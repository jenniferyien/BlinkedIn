require 'rails_helper'

RSpec.describe "employers/edit", type: :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!(
      :location => nil,
      :user => nil,
      :company_name => "MyString",
      :website => "MyString",
      :company_type => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit employer form" do
    render

    assert_select "form[action=?][method=?]", employer_path(@employer), "post" do

      assert_select "input#employer_location_id[name=?]", "employer[location_id]"

      assert_select "input#employer_user_id[name=?]", "employer[user_id]"

      assert_select "input#employer_company_name[name=?]", "employer[company_name]"

      assert_select "input#employer_website[name=?]", "employer[website]"

      assert_select "input#employer_company_type[name=?]", "employer[company_type]"

      assert_select "textarea#employer_description[name=?]", "employer[description]"
    end
  end
end
