require 'spec_helper'

describe Announcement do
  it "has a valid factory" do
    expect( FactoryGirl.build(:announcement) ).to be_valid
  end

end
