require 'spec_helper'

describe Attendee do
  it "has a valid factory" do
    expect( FactoryGirl.build(:attendee) ).to be_valid
  end

  describe "validations" do
    context "missing fields" do
      it "is invalid without a person" do
        expect( FactoryGirl.build(:attendee, person: nil) ).to be_invalid
      end
      it "is valid without a project" do
        expect( FactoryGirl.build(:attendee, project: nil) ).to be_valid
      end
    end

    context "duplicate fields" do
      it "is invalid with a duplicate person" do
        FactoryGirl.create(:attendee, person: "John Doe")
        expect( FactoryGirl.build(:attendee, person: "John Doe") ).to be_invalid
      end
    end

  end
end
