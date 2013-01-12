require 'spec_helper'

describe 'Managing attendees' do
  it 'lists attendees in progress' do
    attendees = 2.times.collect { FactoryGirl.create(:attendee) }

    visit root_path
    attendees.each do |attendee|
      expect(page).to have_content attendee.person
      expect(page).to have_content attendee.project
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

  it 'removes completed attendees' do
    attendee = FactoryGirl.create(:attendee)

    expect{
      visit root_path
      within '.attendee' do
        click_on 'X'
      end
    }.to change(Attendee,:count).by(-1)
  end
end