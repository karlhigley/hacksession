require 'spec_helper'

describe AnnouncementsController do

=begin
  describe "GET #index" do
    it "populates an array of announcements" do
      announcement = FactoryGirl.create(:announcement)
      get :index
      expect(assigns(:announcements)).to eq [announcement]
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end
=end

  describe "GET #new" do
    it "renders the new announcement view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new announcement in the database" do
        expect{
          post :create, announcement: FactoryGirl.attributes_for(:announcement)
        }.to change(Announcement, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, announcement: FactoryGirl.attributes_for(:announcement)
        expect(response).to redirect_to root_url
      end
    end

    context "with invalid attributes" do
      it "does not save the new announcement in the database" do
        expect{
          post :create, announcement: FactoryGirl.attributes_for(:invalid_announcement)
        }.to_not change(Announcement, :count)
      end

      it "redirects to the home page" do
        post :create, announcement: FactoryGirl.attributes_for(:invalid_announcement)
        expect(response).to redirect_to root_url
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @announcement = FactoryGirl.create(:announcement)
    end

    it "deletes the announcement" do
      expect{
        delete :destroy, id: @announcement
      }.to change(Announcement, :count).by(-1)
    end

    it "redirects to the home page" do
      delete :destroy, id: @announcement
      expect(response).to redirect_to root_url
    end
  end

end