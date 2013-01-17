require 'spec_helper'

describe 'Managing announcements' do

  before :all do
    @announcement = FactoryGirl.create(:announcement)
  end

  it 'displays announcement text', js: true do
    visit root_path
    expect(page).to have_content @announcement.content
  end

  it 'allows editing the announcement', js: true do
    attributes = FactoryGirl.attributes_for(:announcement)

    visit root_path
    click_link 'Edit Announcement'
    fill_in 'announcement_content', :with => attributes[:content]
    click_button 'Update Announcement'

    expect(page).to have_content attributes[:content]
  end

end