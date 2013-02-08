require 'spec_helper'

describe AttendeesController do

  describe "GET #index" do
    it "populates an array of attendees" do
      attendee = FactoryGirl.create(:attendee)
      get :index
      expect(assigns(:attendees)).to eq [attendee]
    end

    it "populates an announcement" do
      announcement = FactoryGirl.create(:announcement)
      get :index
      expect(assigns(:announcement)).to eq announcement
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new attendee in the database" do
        expect{
          post :create, attendee: FactoryGirl.attributes_for(:attendee)
        }.to change(Attendee, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, attendee: FactoryGirl.attributes_for(:attendee)
        expect(response).to redirect_to root_url
      end
    end

    context "with invalid attributes" do
      it "does not save the new attendee in the database" do
        expect{
          post :create, attendee: FactoryGirl.attributes_for(:invalid_attendee)
        }.to_not change(Attendee, :count)
      end

      it "redirects to the home page" do
        post :create, attendee: FactoryGirl.attributes_for(:invalid_attendee)
        expect(response).to redirect_to root_url
      end
    end

    context "when logged in" do
      it "associates the new attendee with the current user" do
        user = FactoryGirl.create(:user)
        sign_in user
        post :create, attendee: FactoryGirl.attributes_for(:attendee)
        expect(Attendee.last.user_id).to eq user.id
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @attendee = FactoryGirl.create(:attendee)
    end

    it "deletes the attendee" do
      expect{
        delete :destroy, id: @attendee
      }.to change(Attendee,:count).by(-1)
    end

    it "redirects to the home page" do
      delete :destroy, id: @attendee
      expect(response).to redirect_to root_url
    end
  end

end