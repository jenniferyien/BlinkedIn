require 'rails_helper'

RSpec.describe 'alumnis/show', type: :view do
  before(:each) do
    @alumni = assign(:alumni, Alumni.create!(
                                user: nil,
                                location: nil,
                                about: 'MyText',
                                q1: 'MyText',
                                q2: 'MyText',
                                q3: 'MyText',
                                position: 'Position',
                                view: 1,
                                fun_fact: 'MyText'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
