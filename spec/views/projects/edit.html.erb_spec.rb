require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :alumni => nil,
      :name => "MyString",
      :url => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_alumni_id[name=?]", "project[alumni_id]"

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_url[name=?]", "project[url]"

      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
