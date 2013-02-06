require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect( FactoryGirl.build(:user) ).to be_valid
  end

  describe "validations" do
    context "missing fields" do
      it "is invalid without a name" do
        expect( FactoryGirl.build(:user, name: nil) ).to be_invalid
      end
      it "is invalid without an email" do
        expect( FactoryGirl.build(:user, email: nil) ).to be_invalid
      end
    end

    context "duplicate fields" do
      it "is invalid with a duplicate email" do
        user = FactoryGirl.create(:user)
        expect( FactoryGirl.build(:user, email: user.email) ).to be_invalid
      end
    end

    context "malformed fields" do
      it "is invalid with a very short name" do
        expect( FactoryGirl.build(:user, name: 'a') ).to be_invalid
      end
      it "is invalid with a malformed email" do
        expect( FactoryGirl.build(:user, email: 'malformedemail') ).to be_invalid
      end
    end

  end
end
