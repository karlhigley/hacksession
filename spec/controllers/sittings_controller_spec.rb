require 'spec_helper'

describe SittingsController do

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new sitting in the database" do
        expect{
          post :create, sitting: FactoryGirl.attributes_for(:sitting)
        }.to change(Sitting, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, sitting: FactoryGirl.attributes_for(:sitting)
        response.should redirect_to root_url
      end
    end

    context "with invalid attributes" do
      it "does not save the new sitting in the database" do
        expect{
          post :create, sitting: FactoryGirl.attributes_for(:invalid_sitting)
        }.to_not change(Sitting, :count)
      end

      it "redirects to the home page" do
        post :create, sitting: FactoryGirl.attributes_for(:invalid_sitting)
        response.should redirect_to root_url
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @sitting = FactoryGirl.create(:sitting)
    end

    it "deletes the sitting" do
      expect{
        delete :destroy, id: @sitting
      }.to change(Sitting,:count).by(-1)
    end

    it "redirects to the home page" do
      delete :destroy, id: @sitting
      response.should redirect_to root_url
      end
  end

end