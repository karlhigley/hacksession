require 'spec_helper'

describe 'Managing attendees' do

  before :all do
    @announcement = FactoryGirl.create(:announcement)
  end

  it 'lists attendees' do
    attendees = 2.times.collect { FactoryGirl.create(:attendee) }

    visit attendees_path

    attendees.each do |attendee|
      expect(page).to have_content attendee.person
      expect(page).to have_content attendee.project
      expect(page).to have_content attendee.use_help
      expect(page).to have_content attendee.could_help
    end
  end

  it 'adds a new attendee' do
    visit attendees_path

    attributes = FactoryGirl.attributes_for(:attendee)
    fill_in 'attendee_person', :with => attributes[:person]
    fill_in 'attendee_project', :with => attributes[:project]
    click_button 'Get Started'

    expect(page).to have_content attributes[:person]
    expect(page).to have_content attributes[:project]
  end

  it 'removes departed attendees' do
    attendee = FactoryGirl.create(:attendee)

    expect{
      visit attendees_path
      within '.attendee' do
        click_on 'X'
      end
    }.to change(Attendee, :count).by(-1)
  end

  context 'when logged in' do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit attendees_path
    end

    it 'autofills the name field' do
      expect(page).to have_field "What's your name?", :with => @user.name
    end

    context 'after an attendee entry is created' do
      before :each do
        attendee_attr = FactoryGirl.attributes_for(:attendee)
        fill_in 'attendee_project', :with => attendee_attr[:project]
        click_button 'Get Started'
      end

      it 'links to user twitter page' do
        expect(page).to have_link @user.name, :href => "http://twitter.com/#{@user.twitter}"
      end

      it 'hides the attendee form once an entry is created' do
        expect(page).not_to have_field 'attendee_person'
        expect(page).not_to have_field 'attendee_project'
      end

      it 'shows the attendee form again if the user entry is removed' do
        within '.attendee' do
          click_on 'X'
        end
        expect(page).to have_field 'attendee_person'
        expect(page).to have_field 'attendee_project'
      end
    end

  end

end