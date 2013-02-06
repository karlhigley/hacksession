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
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Password confirmation'
    expect(page).to have_button 'Sign up'
  end

  it 'registers a new user' do
    expect {
      click_link 'Register'
      fill_in 'Name', :with => 'John Doe'
      fill_in 'Email', :with => 'johndoe@example.com'
      fill_in 'user_password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign up'
    }.to change{ User.count }.by(1)
  end

end