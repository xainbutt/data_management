# frozen_string_literal: true

require 'rails_helper'

describe 'User File' do
  context 'Creating new user file' do
    scenario 'creating user file with errors' do
      visit root_path
      click_link 'New User File'
      expect(page).to have_content('New User File')
      within('form') do
        fill_in 'First name', with: 'user@example.com'
        fill_in 'Last name', with: 'password'
      end
      find('input[name="commit"]').click
      expect(page).to have_content('Address can\'t be blank')
    end



    scenario 'successfully creating user file' do
      visit root_path
      click_link 'New User File'
      expect(page).to have_content('New User File')
      within('form') do
        fill_in 'First name', with: 'Zain'
        fill_in 'Last name', with: 'Butt'
        fill_in 'Address', with: 'Model town'
        fill_in 'Program', with: 'Program 1'
        fill_in 'Fee', with: '50'
        fill_in 'Dob', with: Date.current
        fill_in 'Discount', with: '5'
        fill_in 'Ssn', with: 'SSN'
        fill_in 'Email', with: 'xainbutt28@gmail.com'
        fill_in 'Phone no', with: '03222546846'
        fill_in 'Placement date', with: Date.current
        select('IMMEDIATE F/UP', from: 'user_file_payment_status_color')
      end
      find('input[name="commit"]').click
      expect(page).to have_content('User file was successfully created.')
    end
  end

end
