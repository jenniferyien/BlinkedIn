require 'rails_helper'

RSpec.describe 'alumnis/index', type: :view do
  before(:each) do
    assign(:alumnis, [
      Alumni.create!(
        user: nil,
        location: nil,
        about: 'MyText',
        q1: 'MyText',
        q2: 'MyText',
        q3: 'MyText',
        position: 'Position',
        view: 1,
        fun_fact: 'MyText'
      ),
      Alumni.create!(
        user: nil,
        location: nil,
        about: 'MyText',
        q1: 'MyText',
        q2: 'MyText',
        q3: 'MyText',
        position: 'Position',
        view: 1,
        fun_fact: 'MyText'
      )
    ])
  end

  it 'renders a list of alumnis' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Position'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
