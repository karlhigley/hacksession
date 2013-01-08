require 'spec_helper'

describe Sitting do
  it "has a valid factory" do
    expect( FactoryGirl.build(:sitting) ).to be_valid
  end

  describe "validations" do
    context "missing fields" do
      it "is invalid without a person" do
        expect( FactoryGirl.build(:sitting, person: nil) ).to be_invalid
      end
      it "is valid without a project" do
        expect( FactoryGirl.build(:sitting, project: nil) ).to be_valid
      end
    end

    context "duplicate fields" do
      it "is invalid with a duplicate person" do
        FactoryGirl.create(:sitting, person: "John Doe")
        expect( FactoryGirl.build(:sitting, person: "John Doe") ).to be_invalid
      end
    end

  end
end
