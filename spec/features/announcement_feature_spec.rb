require 'spec_helper'

describe 'Managing announcements' do

  it 'displays announcements' do
    announcements = 2.times.collect { FactoryGirl.create(:announcement) }

    visit root_path
    announcements.each do |announcement|
      expect(page).to have_content announcement.content
    end
  end

  it 'adds a new announcement' do
    attributes = FactoryGirl.attributes_for(:announcement)

    visit root_path
    click_link 'Post an announcement'
    fill_in 'announcement_content', :with => attributes[:content]
    click_button 'Post announcement'

    expect(page).to have_content attributes[:content]
  end

  it 'removes announcements' do
    announcement = FactoryGirl.create(:announcement)

    expect{
      visit root_path
      within '.announcement' do
        click_on 'X'
      end
    }.to change(Announcement, :count).by(-1)
  end

end