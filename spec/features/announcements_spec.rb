require 'spec_helper'

describe 'Managing announcements' do

  before :each do
    @announcement = FactoryGirl.create(:announcement)
    visit root_path
  end

  it 'displays announcement text' do
    expect(page).to have_content @announcement.content
  end

  context 'when not logged in' do
    it "doesn't allow editing the announcement" do
      expect(page).not_to have_link 'Edit Announcement'
    end
  end

  context 'when logged in' do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit root_path
    end

    it 'allows editing the announcement' do
      attributes = FactoryGirl.attributes_for(:announcement)

      click_link 'Edit Announcement'
      fill_in 'announcement_content', :with => attributes[:content]
      click_button 'Update Announcement'

      expect(page).to have_content attributes[:content]
    end
  end

end