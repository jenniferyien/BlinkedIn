require 'rails_helper'

RSpec.describe "alumnis/edit", type: :view do
  before(:each) do
    @alumni = assign(:alumni, Alumni.create!(
      :user => nil,
      :location => nil,
      :about => "MyText",
      :q1 => "MyText",
      :q2 => "MyText",
      :q3 => "MyText",
      :position => "MyString",
      :view => 1,
      :fun_fact => "MyText"
    ))
  end

  it "renders the edit alumni form" do
    render

    assert_select "form[action=?][method=?]", alumni_path(@alumni), "post" do

      assert_select "input#alumni_user_id[name=?]", "alumni[user_id]"

      assert_select "input#alumni_location_id[name=?]", "alumni[location_id]"

      assert_select "textarea#alumni_about[name=?]", "alumni[about]"

      assert_select "textarea#alumni_q1[name=?]", "alumni[q1]"

      assert_select "textarea#alumni_q2[name=?]", "alumni[q2]"

      assert_select "textarea#alumni_q3[name=?]", "alumni[q3]"

      assert_select "input#alumni_position[name=?]", "alumni[position]"

      assert_select "input#alumni_view[name=?]", "alumni[view]"

      assert_select "textarea#alumni_fun_fact[name=?]", "alumni[fun_fact]"
    end
  end
end
