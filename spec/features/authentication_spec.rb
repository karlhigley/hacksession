require 'spec_helper'

describe 'Authenticating' do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  it 'displays a sign in link' do
    visit root_path
    expect(page).to have_link 'Sign In'
  end

  it 'signs in a user' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button 'Sign in'
    expect(page).to have_link @user.name
  end

  context 'after signing in' do
    before :each do
      login_as(@user, :scope => :user)
      visit root_path
    end

    it 'shows a sign out link' do
      expect(page).to have_link 'Sign Out'
    end

    it 'doesnt show a sign in link' do
      expect(page).not_to have_link 'Sign In'
    end
  end

end