require 'spec_helper'

describe 'Managing attendees' do

  before :all do
    @announcement = FactoryGirl.create(:announcement)
    puts "Before all announcement: #{@announcement.inspect}"
  end

  it 'lists attendees' do
    attendees = 2.times.collect { FactoryGirl.create(:attendee) }

    visit root_path
    attendees.each do |attendee|
      expect(page).to have_content attendee.person
      expect(page).to have_content attendee.project
      expect(page).to have_content attendee.use_help
      expect(page).to have_content attendee.could_help
    end
  end

  it 'adds a new attendee' do
    attributes = FactoryGirl.attributes_for(:attendee)

    visit root_path
    fill_in 'attendee_person', :with => attributes[:person]
    fill_in 'attendee_project', :with => attributes[:project]
    click_button 'Get Started'

    expect(page).to have_content attributes[:person]
    expect(page).to have_content attributes[:project]
  end

  it 'removes departed attendees' do
    attendee = FactoryGirl.create(:attendee)

    expect{
      visit root_path
      within '.attendee' do
        click_on 'X'
      end
    }.to change(Attendee, :count).by(-1)
  end
end