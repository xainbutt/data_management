require 'rails_helper'

describe 'visiting homepage' do

  scenario 'the visitor sees user file text ' do
    visit root_path
    expect(page).to have_content('User Files')
  end

end