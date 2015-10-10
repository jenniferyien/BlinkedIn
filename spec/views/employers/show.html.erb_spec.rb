require 'rails_helper'

RSpec.describe 'employers/show', type: :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!(
                                    location: nil,
                                    user: nil,
                                    company_name: 'Company Name',
                                    website: 'Website',
                                    company_type: 'Company Type',
                                    description: 'MyText'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Company Type/)
    expect(rendered).to match(/MyText/)
  end
end
