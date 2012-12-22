require 'spec_helper'

describe 'Managing sittings' do
  it 'lists sittings in progress' do
    sittings = 2.times.collect { FactoryGirl.create(:sitting) }

    visit root_path
    sittings.each do |sitting|
      page.should have_content sitting.person
      page.should have_content sitting.project
    end
  end

  it 'adds a new sitting' do
    attributes = FactoryGirl.attributes_for(:sitting)

    visit root_path
    fill_in 'sitting_person', :with => attributes[:person]
    fill_in 'sitting_project', :with => attributes[:project]
    click_button 'Get Started'

    page.should have_content attributes[:person]
    page.should have_content attributes[:project]
  end

  it 'removes completed sittings' do
    sitting = FactoryGirl.create(:sitting)

    expect{
      visit root_path
      within '.sitting' do
        click_on 'X'
      end
    }.to change(Sitting,:count).by(-1)
  end
end