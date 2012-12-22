require 'spec_helper'

describe Sitting do
  it "has a valid factory" do
    FactoryGirl.build(:sitting).should be_valid
  end

  describe "validations" do
    context "missing fields" do
      it "is invalid without a person" do
        FactoryGirl.build(:sitting, person: nil).should_not be_valid
      end
      it "is valid without a project" do
        FactoryGirl.build(:sitting, project: nil).should be_valid
      end
    end

    context "duplicate fields" do
      it "is invalid with a duplicate person" do
        FactoryGirl.create(:sitting, person: "John Doe")
        FactoryGirl.build(:sitting, person: "John Doe").should_not be_valid
      end
    end

  end
end
