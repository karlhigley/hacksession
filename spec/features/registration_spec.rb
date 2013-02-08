require 'spec_helper'

describe 'Registration' do

  before :each do
    visit root_path
  end

  it 'has a registration link' do
    expect(page).to have_link 'Register'
  end

  it 'displays a registration form' do
    click_link 'Register'
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Twitter Handle'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Password Confirmation'
    expect(page).to have_button 'Sign up'
  end

  it 'registers a new user' do
    user_attr = FactoryGirl.attributes_for(:user)
    expect {
      click_link 'Register'
      fill_in 'Name', :with => user_attr[:name]
      fill_in 'Email', :with => user_attr[:email]
      fill_in 'Twitter Handle', :with => user_attr[:twitter]
      fill_in 'user_password', :with => user_attr[:password]
      fill_in 'Password Confirmation', :with => user_attr[:password]
      click_button 'Sign up'
    }.to change{ User.count }.by(1)
  end

end