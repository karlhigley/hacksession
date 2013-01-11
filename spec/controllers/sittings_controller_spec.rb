require 'spec_helper'

describe SittingsController do

  describe "GET #index" do
    it "populates an array of attendees" do
      sitting = FactoryGirl.create(:sitting)
      get :index
      expect(assigns(:sittings)).to eq [sitting]
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new sitting in the database" do
        expect{
          post :create, sitting: FactoryGirl.attributes_for(:sitting)
        }.to change(Sitting, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, sitting: FactoryGirl.attributes_for(:sitting)
        expect(response).to redirect_to root_url
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
        expect(response).to redirect_to root_url
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
      expect(response).to redirect_to root_url
    end
  end

end