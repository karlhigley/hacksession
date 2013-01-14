require 'spec_helper'

describe Announcement do
  it "has a valid factory" do
    expect( FactoryGirl.build(:announcement) ).to be_valid
  end

  describe "validations" do
    context "missing fields" do
      it "is invalid without content" do
        expect( FactoryGirl.build(:announcement, content: nil) ).to be_invalid
      end
    end

  end
end
