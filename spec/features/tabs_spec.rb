require 'spec_helper'

describe 'Changing tabs' do
  let(:tab_links) { {'Announcements' => '#announcements', 'Attendees' => '#attendees'} }

  before :each do
    visit root_path
  end

  it 'has the right tabs' do
    tab_links.keys.each do |text|
      expect(page).to have_link text
    end
  end

  it 'switches between tabs' do
    tab_links.each_pair do |text, selector|
      click_link text
      expect(page).to have_css selector, :visible => true
    end
  end

end